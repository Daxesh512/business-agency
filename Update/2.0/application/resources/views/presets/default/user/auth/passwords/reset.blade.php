@extends($activeTemplate.'layouts.frontend')
@section('content')
<section class="account py-80">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-7 col-xl-5 account-form">
                    <h5 class="card-title">@lang('Reset Password')</h5>

                    <div class="mb-4">
                        <p>@lang('Your account is verified successfully. Now you can change your password. Please enter
                            a strong password and don\'t share it with anyone.')</p>
                    </div>
                    <form method="POST" action="{{ route('user.password.update') }}">
                        @csrf
                        <input type="hidden" name="email" value="{{ $email }}">
                        <input type="hidden" name="token" value="{{ $token }}">
                        <div class="form-group mb-3">
                            <label class="form-label">@lang('Password')</label>
                            <input type="password" class="form-control form--control" name="password" required>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">@lang('Confirm Password')</label>
                            <input type="password" class="form-control form--control" name="password_confirmation"
                                required>
                        </div>
                        <div class="form-group mb-3">
                            <button type="submit" class="btn btn--base"> @lang('Submit')</button>
                        </div>
                    </form>
        </div>
    </div>
</div>
</section>
@endsection

