@extends($activeTemplate.'layouts.frontend')
@section('content')
@php
    $policyPages = getContent('policy_pages.element',false,null,true);
    $credentials = $general->socialite_credentials;
@endphp
<!-- Registration Start Here  -->
<section class="account py-80 position-relative">
    <img class="login-bg-img" src="{{asset($activeTemplateTrue.'images/login-bg.png')}}" alt="">
    <div class="account-inner">
        <div class="container">
            <div class="row gy-4 justify-content-end">
                <div class="col-lg-6">
                    <div class="account-form">
                        <div class="account-form__content mb-4">
                            <h3 class="account-form__title mb-2">@lang('Sign Up Your Account') </h3>
                            <p class="account-form__desc">@lang('Please Provide your valid informations to register')!</p>
                        </div>
                        <form action="{{ route('user.register') }}" method="POST" class="verify-gcaptcha">
                            @csrf
                            <div class="row gy-3">
                                <div class="col-sm-6">
                                     <div class="form-group">
                                        <label for="username" class="form--label">@lang('Username')</label>
                                        <input type="text" class="form--control checkUser" id="username" name="username" value="{{ old('username') }}" required>
                                        <small class="text-danger usernameExist"></small>
                                     </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="email" class="form--label">@lang('E-Mail Address')</label>
                                       <input type="email" class="form--control checkUser" id="email" name="email" value="{{ old('email') }}" required>
                                    </div>
                               </div>

                                <div class="col-sm-6">
                                    <label for="your-password" class="form--label">@lang('Password')</label>
                                    <div class="input-group">
                                        <input id="your-password" type="password" class="form-control form--control" name="password" required>
                                        <div class="password-show-hide  fas fa-lock" id="#your-password"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label for="confirm-password" class="form--label">@lang('Confirm Password')</label>
                                    <div class="input-group">
                                        <input id="confirm-password" type="password" class="form-control form--control" name="password_confirmation" required>
                                        <div class="password-show-hide fas fa-lock" id="#confirm-password"></div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <x-captcha></x-captcha>
                                </div>
                                @if($general->agree)
                                <div class="col-sm-12">
                                    <div class="form--check">
                                        <input class="form-check-input" type="checkbox" id="agree" @checked(old('agree')) name="agree" required>
                                        <div class="form-check-label">
                                            <label class="" for="remember"> @lang('I agree with') @foreach($policyPages as $policy)</label>
                                            <a href="{{ route('policy.pages',[slug($policy->data_values->title),$policy->id]) }}" class="text--base">{{ __($policy->data_values->title) }}</a>
                                            <label class="" for="remember"> @if(!$loop->last) @endif @endforeach </label>
                                        </div>
                                    </div>
                                </div>
                                @endif

                                <div class="col-sm-12">
                                    <button type="submit" class="btn btn--base w-100" id="recaptcha">
                                        @lang('Sign Up') <i class="fa-sharp fas fa-arrow-right"></i>
                                        <span style="top: -1px; left: 369px;"></span>
                                    </button>
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
                                <div class="col-sm-12">
                                    <div class="have-account text-center">
                                        <p class="have-account__text"> @lang('Already Have An Account')? <a href="{{route('user.login')}}" class="have-account__link text--base">@lang('Login Now')</a></p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="existModalCenter" tabindex="-1" role="dialog" aria-labelledby="existModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="existModalLongTitle">@lang('You are with us')</h5>
              <span type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                  <i class="las la-times"></i>
              </span>
            </div>
            <div class="modal-body">
              <h6 class="text-center">@lang('You already have an account please Login ')</h6>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-dark btn-sm" data-bs-dismiss="modal">@lang('Close')</button>
              <a href="{{ route('user.login') }}" class="btn btn--base btn-sm">@lang('Login')</a>
            </div>
          </div>
        </div>
      </div>
</section>
<!-- Registration End Here  -->
@endsection

@push('style')
<style>
    .country-code .input-group-text{
        background: #fff !important;
    }
    .country-code select{
        border: none;
    }
    .country-code select:focus{
        border: none;
        outline: none;
    }
</style>
@endpush

@push('script')
    <script>
        (function ($) {
            "use strict";

            $('.checkUser').on('focusout',function(e){
                var url = '{{ route('user.checkUser') }}';
                var value = $(this).val();
                var token = '{{ csrf_token() }}';

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

