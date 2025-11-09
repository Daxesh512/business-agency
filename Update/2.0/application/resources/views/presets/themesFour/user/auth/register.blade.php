@extends($activeTemplate.'layouts.auth')
@section('content')
@php
    $policyPages = getContent('policy_pages.element',false,null,true);
    $credentials = $general->socialite_credentials;
@endphp

<!--=======-** Sign Up start **-=======-->
<section class="account">
    <div class="container ">
        <div class="row justify-content-center">
            <div class="col-xl-8 col-lg-10 col-md-10 col-12">
                <div class="account-form">
                    <div class="logo">
                       <a href="{{route('home')}}"> <img src="{{ getImage(getFilePath('logoIcon').'/logo.png', '?'.time()) }}" alt="{{config('app.name')}}"></a>
                    </div>
                    <div>
                        <h3>@lang('Sign Up')!</h3>
                    </div>
                    <form action="{{ route('user.register') }}" method="POST" class="verify-gcaptcha">
                        @csrf
                        <div class="row gy-3">
                            <div class="col-lg-6 col-12">
                                <div class="form-group">
                                    <label for="name" class="form--label">@lang('Username')</label>
                                    <input type="text" class="form--control checkUser" id="username" name="username" value="{{ old('username') }}" placeholder="@lang('Username')" required>
                                    <small class="text-danger usernameExist"></small>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="form-group">
                                    <label for="username" class="form--label">@lang('E-Mail Address')</label>
                                    <input type="email" class="form--control checkUser" id="email" name="email" value="{{ old('email') }}" placeholder="@lang('Email')" required>
                                    <small class="text-danger emailExist"></small>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="form-group">
                                    <label class="form--label">@lang('Country')</label>
                                    <select name="country" class="form-select form--control">
                                        @foreach($countries as $key => $country)
                                            <option data-mobile_code="{{ $country->dial_code }}" value="{{ $country->country }}" data-code="{{ $key }}">{{ __($country->country) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="form-group">
                                    <label class="form--label">@lang('Mobile')</label>
                                    <div class="input-group ">
                                        <span class="input-group-text bg--base text-white mobile-code">

                                        </span>
                                        <input type="hidden" name="mobile_code">
                                        <input type="hidden" name="country_code">
                                        <input type="number" name="mobile" value="{{ old('mobile') }}" class="form-control form--control checkUser" required>
                                    </div>
                                    <small class="text-danger mobileExist"></small>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <label for="your-password" class="form--label">@lang('Password')</label>
                                <div class="input-group">
                                    <input id="password" type="password" class="form-control form--control form--password" name="password" placeholder="@lang('Password')" required>
                                    <div class="password-show-hide toggle-password-change fas fa-eye-slash" data-target="password">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <label for="confirm-password" class="form--label">@lang('Confirm Password')</label>
                                <div class="input-group">
                                    <input id="confirm-password" type="password" class="form-control form--control form--password" name="password_confirmation" placeholder="@lang('Confirm Password')" required>
                                    <div class="password-show-hide toggle-password-change fas fa-eye-slash" data-target="confirm-password">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <x-captcha></x-captcha>
                            </div>
                            @if($general->agree)
                            <div class="col-sm-12 my-2">
                                <div class="form--check">
                                    <input class="form-check-input me-2" type="checkbox" id="agree" @checked(old('agree')) name="agree" required>
                                    <label for="agree">  @lang('I agree with')
                                        @foreach($policyPages as $policy)
                                        <a href="{{ route('policy.pages',[slug($policy->data_values->title),$policy->id]) }}" class="text--base">{{__($policy->data_values->title) }}</a>
                                        @if(!$loop->last), @endif
                                        @endforeach
                                   </label>
                                </div>
                            </div>
                            @endif
                            <div class="col-12">
                                <button type="submit" class="btn--base w-100" id="recaptcha">@lang('Sign Up')</button>
                            </div>

                            @if ($credentials->google->status == 1 || $credentials->facebook->status == 1 || $credentials->linkedin->status == 1)
                            <div class="col-12">
                                <hr class="hr" data-content="OR">
                            </div>
                            <div class="col-12">
                                <div class="social">
                                    @if ($credentials->google->status == 1)
                                    <a href="{{ route('user.social.login', 'google') }}" class="icon">
                                        <i class="fa-brands fa-google"></i>
                                    </a>
                                    @endif
                                    @if ($credentials->facebook->status == 1)
                                    <a href="{{ route('user.social.login', 'facebook') }}" class="icon">
                                        <i class="fa-brands fa-facebook"></i>
                                    </a>
                                    @endif
                                </div>
                            </div>
                            @endif

                            <div class="col-12">
                                <div class="text-center">
                                    <p class="text">@lang('Already Have An Account')? <a href="{{route('user.login')}}"
                                        class="text--base">@lang('Login Now')</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=======-** Sign Up End **-=======-->

@endsection

@push('script')
    <script>
      "use strict";
        (function ($) {
            @if($mobileCode)
            $(`option[data-code={{ $mobileCode }}]`).attr('selected','');
            @endif

            $('select[name=country]').change(function(){
                $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
                $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
                $('.mobile-code').text('+'+$('select[name=country] :selected').data('mobile_code'));
            });
            $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
            $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
            $('.mobile-code').text('+'+$('select[name=country] :selected').data('mobile_code'));

            $('.checkUser').on('focusout',function(e){
                var url = '{{ route('user.checkUser') }}';
                var value = $(this).val();
                var token = '{{ csrf_token() }}';
                if ($(this).attr('name') == 'mobile') {
                    var mobile = `${$('.mobile-code').text().substr(1)}${value}`;
                    var data = {mobile:mobile,_token:token}
                }
                if ($(this).attr('name') == 'email') {
                    var data = {email:value,_token:token}
                }
                if ($(this).attr('name') == 'username') {
                    var data = {username:value,_token:token}
                }
                $.post(url,data,function(response) {
                  if (response.data != false && response.type == 'email') {
                    $('#existModalCenter').modal('show');
                  }else if(response.data != false){
                    $(`.${response.type}Exist`).text(`${response.type} already exist`);
                  }else{
                    $(`.${response.type}Exist`).text('');
                  }
                });
            });
        })(jQuery);

    </script>
@endpush

