@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="dashboard-card-wrap mt-0">
                    <form class="register" action="" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row gy-4">
                            <div class="col-sm-12">
                                <div class="drop-file-wrap--">
                                    <div class="dashboard_profile_wrap">
                                        <div class="profile_photo mb-2">
                                            <img src="{{ getImage(getFilePath('userProfile').'/'.@$user->image,getFileSize('userProfile')) }}"  alt="@lang('user profile')">
                                            <div class="photo_upload">
                                                <label for="image"><i class="fas fa-image"></i></label>
                                                <input id="image" type="file" name="image" class="upload_file">
                                            </div>
                                        </div>
                                        <div class="user-info text-center">
                                            <p><span>@lang('Name'):</span> {{__($user->fullname)}}</p>
                                            <p><span>@lang('Email'):</span> {{$user->email}}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="first_name" class="form--label">@lang('First Name')</label>
                                    <div class="input--group">
                                        <input type="text" class="form--control" id="first_name" name="firstname"
                                            value="{{$user->firstname}}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="last_name" class="form--label">@lang('Last Name')</label>
                                    <div class="input--group">
                                        <input type="text" class="form--control" id="last_name" name="lastname"
                                            value="{{$user->lastname}}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email_adress" class="form--label">@lang('E-mail Address')</label>
                                    <div class="input--group">
                                        <input type="text" class="form--control" id="email_adress" value="{{$user->email}}"
                                            readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="address" class="form--label">@lang('Address')</label>
                                    <div class="input--group">
                                        <input type="text" id="address" class="form--control" name="address"
                                            value="{{@$user->address->address}}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="state" class="form--label">@lang('State')</label>
                                    <div class="input--group">
                                        <input type="text" id="state" class="form--control" name="state"
                                            value="{{@$user->address->state}}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="zip" class="form--label">@lang('Zip Code')</label>
                                    <div class="input--group">
                                        <input type="text" id="zip" class="form--control" name="zip"
                                            value="{{@$user->address->zip}}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="city" class="form--label">@lang('City')</label>
                                    <div class="input--group">
                                        <input type="text" id="city" class="form--control" name="city"
                                            value="{{@$user->address->city}}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Country')</label>
                                    <select name="country" id="country" class="form--control">
                                        @foreach($countries as $key => $country)
                                            <option {{ (@$user->address->country == $country->country) ? 'selected' : '' }} data-mobile_code="{{ $country->dial_code }}" value="{{$key}}">
                                                {{ __($country->country) }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Mobile Number')</label>
                                    <div class="input-group">
                                        <span class="input-group-text mobile-code"></span>
                                        <input type="number" name="mobile" value="{{ old('mobile', $user->mobile) }}" id="mobile" class="form--control form-control checkUser" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 text-end">
                                <button type="submit" class="btn--base ms-2">
                                    @lang('Submit')
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
$(document).ready(function() {
    "use strict"
    let mobileElement = $('.mobile-code');

    $('select[name=country]').change(function () {
        let dialCode = $(this).find(':selected').data('mobile_code');
        mobileElement.text('+' + dialCode);
    });

    $('select[name=country]').trigger('change');
});
</script>

@endpush
