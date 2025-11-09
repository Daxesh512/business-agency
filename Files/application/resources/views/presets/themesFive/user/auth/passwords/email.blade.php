@extends($activeTemplate.'layouts.frontend')
@section('content')
<div class="container">
    <div class="row justify-content-center py-80">
        <div class="col-md-8 col-lg-7 col-xl-5">
            <div class="custom-body">
                <h5>{{ __($pageTitle) }}</h5>
                <div class="mb-4">
                    <p>@lang('To recover your account please provide your email or username to find your account.')
                    </p>
                </div>
                <form method="POST" action="{{ route('user.password.email') }}">
                    @csrf
                    <div class="form-group mb-3">
                        <label class="form--label">@lang('Email or Username')</label>
                        <input type="text" class="form-control form--control" name="value"
                            value="{{ old('value') }}" required autofocus="off">
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn--base">@lang('Submit')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
