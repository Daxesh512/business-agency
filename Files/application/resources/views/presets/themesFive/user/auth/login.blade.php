@extends($activeTemplate.'layouts.auth')
@section('content')
@php
$credentials = $general->socialite_credentials;
@endphp
<!--=======-** Sign In start **-=======-->
<section class="account bg-img" data-background="{{ asset($activeTemplateTrue .'images/banner_bg.png') }}">
    <div class="container ">
        <div class="row justify-content-center">
            <div class="col-xl-8 col-lg-10 col-md-10 col-12">
                <div class="account-form">
                    <div class="logo">
                       <a href="{{route('home')}}"> <img src="{{ getImage(getFilePath('logoIcon').'/logo.png', '?'
                        .time()) }}" alt="{{config('app.name')}}"></a>
                    </div>
                    <div>
                        <h3>@lang('Welcome Back')!</h3>
                    </div>
                    <form method="POST" action="{{ route('user.login') }}" class="verify-gcaptcha">
                        @csrf
                        <div class="row gy-3">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="username" class="form--label">@lang('Username or Email')</label>
                                    <input type="text" class="form--control" id="username" name="username" value="{{ old('username') }}" placeholder="@lang('User Name  Or Email')" required>
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="your-password" class="form--label">@lang('Password')</label>
                                <div class="input-group">
                                    <input id="password" type="password" class="form--control form--password" name="password" placeholder="@lang('Password')"
                                    required>
                                    <div class="password-show-hide toggle-password-change fas fa-eye-slash"
                                            data-target="password">
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <x-captcha></x-captcha>
                            </div>
                            <div class="col-12">
                                <div class="d-flex flex-wrap justify-content-between">
                                    <div class="form--check">
                                        <input class="form-check-input" type="checkbox" name="remember" id="remember"
                                        {{ old('remember') ? 'checked' : '' }}>
                                        <label class="form-check-label" for="remember">@lang('Remember me')</label>
                                    </div>
                                    <a href="{{ route('user.password.request') }}" class="text">@lang('Forgot Password')?</a>
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn--base w-100" id="recaptcha">@lang('Sign In')</button>
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
                                    <p class="text">@lang('Don\'t have any account?')  <a href="{{ route('user.register') }}"
                                        class="text--base">@lang('Create Account')</a>
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
<!--=======-** Sign In End **-=======-->

@endsection
