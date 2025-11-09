@extends($activeTemplate.'layouts.frontend')

@section('content')
<div class="container">
    <div class="row justify-content-center py-80">
        <div class="col-md-8 col-lg-7 col-xl-7">
            <div class="custom-body">
                <h5>{{ __($pageTitle) }}</h5>
                <form method="POST" action="{{ route('user.data.submit') }}">
                    @csrf
                    <div class="row gy-3">
                        <div class="form-group col-sm-6">
                            <label class="form--label">@lang('First Name')</label>
                            <input type="text" class="form-control form--control" name="firstname"
                                value="{{ old('firstname') }}" required>
                        </div>

                        <div class="form-group col-sm-6">
                            <label class="form--label">@lang('Last Name')</label>
                            <input type="text" class="form-control form--control" name="lastname"
                                value="{{ old('lastname') }}" required>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="form--label">@lang('Address')</label>
                            <input type="text" class="form-control form--control" name="address"
                                value="{{ old('address') }}">
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="form--label">@lang('State')</label>
                            <input type="text" class="form-control form--control" name="state"
                                value="{{ old('state') }}">
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="form--label">@lang('Zip Code')</label>
                            <input type="text" class="form-control form--control" name="zip" value="{{ old('zip') }}">
                        </div>

                        <div class="form-group col-sm-6">
                            <label class="form--label">@lang('City')</label>
                            <input type="text" class="form-control form--control" name="city" value="{{ old('city') }}">
                        </div>
                        <div class="form-group col-sm-12">
                            <button type="submit" class="btn--base">
                                @lang('Submit')
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
