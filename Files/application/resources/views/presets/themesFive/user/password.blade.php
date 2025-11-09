@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="dashboard-card-wrap mt-0">
                    <div class="row gy-4">
                        <div class="col-12">
                            <div class="border-box user-profile">
                                <form action="#" method="POST">
                                    @csrf
                                    <div class="row gy-3 justify-content-center">
                                        <div class="col-sm-12">
                                            <label for="current-password" class="form--label">@lang('Current Password')</label>
                                            <div class="input-group">
                                                <input id="current_password" type="password" class="form-control form--password form--control" name="current_password" required
                                                autocomplete="current-password">
                                                <div class="password-show-hide toggle-password-change fas fa-eye-slash"
                                                    data-target="current_password"> </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="password" class="form--label">@lang('Password')</label>
                                            <div class="input-group">
                                                <input id="password" type="password" class="form-control form--password form--control" name="password" required autocomplete="current-password">
                                                <div class="password-show-hide toggle-password-change fas fa-eye-slash"
                                                    data-target="password">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="password_confirmation" class="form--label">@lang('Confirm Password')</label>
                                            <div class="input-group">
                                                <input id="password_confirmation" type="password" class="form-control form--password form--control" name="password_confirmation"
                                                required autocomplete="current-password">
                                                <div class="password-show-hide toggle-password-change fas fa-eye-slash"
                                                    data-target="password_confirmation"> </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 justify-content-end d-flex">
                                            <button type="submit" class="btn--base">
                                                @lang('Change')
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
