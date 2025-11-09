@extends($activeTemplate.'layouts.master')
@section('content')
<div class="col-xl-9 col-lg-12">
    <div class="dashboard-body">
        <div class="row gy-4 justify-content-center">
            <div  class="contactus-form">
            <div class="col-lg-12">
                <div class="user-profile">
                    <form class="register" action="" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row gy-3">
                            <div class="col-sm-12">
                                <h4 class="mb-1">{{__($pageTitle)}}</h4>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="firstname" class="form--label">@lang('First Name')</label>
                                    <input type="text" class="form--control" id="firstname" name="firstname"
                                    value="{{$user->firstname}}" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="lastname" class="form--label">@lang('Last Name')</label>
                                    <input type="text" class="form--control" id="lastname" name="lastname"
                                    value="{{$user->lastname}}" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email" class="form--label">@lang('E-mail Address')</label>
                                    <input type="text" class="form--control" id="email" name="email"
                                    value="{{$user->email}}" readonly>
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
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="address" class="form--label">@lang('Address')</label>
                                    <input type="text" class="form--control" id="address" name="address"
                                    value="{{@$user->address->address}}">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="address" class="form--label">@lang('State')</label>
                                    <input type="text" class="form--control" id="address" name="state"
                                    value="{{@$user->address->state}}">
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="address" class="form--label">@lang('City')</label>
                                    <input type="text" class="form--control" id="address" name="city"
                                    value="{{@$user->address->city}}">
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <button type="submit" class="btn btn--base w-50">@lang('Submit')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
     </div>
  </div>
</div>
@endsection

@push('style')
    <style>

        .country-code select{
            border: none;
        }
        .country-code select:focus{
            border: none;
            outline: none;
        }
    </style>
@endpush
@push('script-lib')
    <script src="{{ asset('assets/global/js/secure_password.js') }}"></script>
@endpush
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
