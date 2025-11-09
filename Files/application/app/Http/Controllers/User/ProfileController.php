<?php

namespace App\Http\Controllers\User;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class ProfileController extends Controller
{
    public function profile()
    {
        $pageTitle = "Profile Setting";
        $user = auth()->user();
        $info = json_decode(json_encode(getIpInfo()), true);
        $mobileCode = @implode(',', $info['code']);
        $countries = json_decode(file_get_contents(resource_path('views/includes/country.json')));
        return view($this->activeTemplate. 'user.profile_setting', compact('pageTitle','user','mobileCode','countries'));
    }

    public function submitProfile(Request $request)
    {
        $user = auth()->user();
        $countryData = json_decode(file_get_contents(resource_path('views/includes/country.json')));
        $countryArray   = (array)$countryData;
        $countries      = implode(',', array_keys($countryArray));

        $countryCode    = $request->country;
        $country        = $countryData->$countryCode->country;
        $dialCode       = $countryData->$countryCode->dial_code;

        $request->validate([
            'firstname' => 'required|string|max:40',
            'lastname' => 'required|string|max:40',
            'mobile' => 'required|string|max:40',
            'country' => 'required|in:'.$countries,
            'image' => ['nullable','image',new FileTypeValidate(['jpg','jpeg','png'])]
        ]);

        $user->firstname = $request->firstname;
        $user->lastname = $request->lastname;
        $mobileNumber = $request->mobile;

        if (!Str::startsWith($mobileNumber, $dialCode)) {
            $mobileNumber = $dialCode . $mobileNumber;
        }
        $user->mobile = $mobileNumber;
        $user->country_code = $countryCode;

        $user->address = [
            'address' => $request->address,
            'state' => $request->state,
            'zip' => $request->zip,
            'country' => @$country,
            'city' => $request->city,
        ];

        if ($request->hasFile('image'))
        {
            $path = getFilePath('userProfile');
            fileManager()->removeFile($path.'/'.$user->image);
            $directory = $user->username."/". $user->id;
            $path = getFilePath('userProfile').'/'.$directory;
            $filename = $directory.'/'.fileUploader($request->image, $path, getFileSize('userProfile'));
            $user->image = $filename;
        }

        $user->save();

        $notify[] = ['success', 'Profile has been updated successfully'];
        return back()->withNotify($notify);
    }

    public function changePassword()
    {
        $pageTitle = 'Change Password';
        return view($this->activeTemplate . 'user.password', compact('pageTitle'));
    }

    public function submitPassword(Request $request)
    {

        $passwordValidation = Password::min(6);
        $general = gs();
        if ($general->secure_password) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }

        $this->validate($request, [
            'current_password' => 'required',
            'password' => ['required','confirmed',$passwordValidation]
        ]);

        $user = auth()->user();
        if (Hash::check($request->current_password, $user->password)) {
            $password = Hash::make($request->password);
            $user->password = $password;
            $user->save();
            $notify[] = ['success', 'Password changes successfully'];
            return back()->withNotify($notify);
        } else {
            $notify[] = ['error', 'The password doesn\'t match!'];
            return back()->withNotify($notify);
        }
    }

    public function imageUpdate(Request $request)
    {
        $this->validate($request, [
            'image' => ['nullable','image',new FileTypeValidate(['jpg','jpeg','png'])]
        ]);
        $user = auth()->user();
        if ($request->hasFile('image'))
        {
            $path = getFilePath('userProfile');
            fileManager()->removeFile($path.'/'.$user->image);
            $directory = $user->username."/". $user->id;
            $path = getFilePath('userProfile').'/'.$directory;
            $filename = $directory.'/'.fileUploader($request->image, $path, getFileSize('userProfile'));
            $user->image = $filename;
        }
        $user->save();
        $notify[] = ['success', 'Profile image has been updated successfully'];
        return to_route('user.home')->withNotify($notify);
    }
}
