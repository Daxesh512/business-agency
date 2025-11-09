@extends($activeTemplate.'layouts.master')

@section('content')
<div class="col-xl-9 col-lg-8">
    <div class="dashboard-body">
        <div class="row gy-4 justify-content-center">
            <div  class="contactus-form">
            <div class="col-lg-12">
                <div class="user-profile">
                    <form action="" method="post">
                        @csrf
                        <div class="row gy-3">
                            <div class="col-sm-12">
                                <h4>{{__($pageTitle)}}</h4>
                            </div>
                            <div class="col-sm-12">
                                <label for="your-password" class="form--label">@lang('Current Password')</label>
                                <div class="input-group">
                                    <input id="your-password" type="password" class="form-control form--control" name="current_password" required
                                    autocomplete="current-password">
                                    <div class="password-show-hide fas fa-lock" id="#your-password"></div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <label for="new-password" class="form--label">@lang('Password')</label>
                                <div class="input-group">
                                    <input id="new-password" type="password" class="form-control form--control" name="password" required
                                    autocomplete="current-password">
                                    <div class="password-show-hide fas fa-lock" id="#new-password"></div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <label for="again-your-password" class="form--label">@lang('Confirm Password')</label>
                                <div class="input-group">
                                    <input id="again-your-password" type="password" class="form-control form--control" name="password_confirmation"
                                    required autocomplete="current-password">
                                    <div class="password-show-hide fas fa-lock" id="#again-your-password"></div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <button type="submit" class="btn btn--base">
                                    @lang('Submit') <i class="fas  fa-arrow-right"></i>
                                    <span style="top: 221.609px; left: 132px;"></span>
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
@endsection

