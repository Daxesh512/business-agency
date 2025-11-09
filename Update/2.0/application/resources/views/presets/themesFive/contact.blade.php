@extends($activeTemplate.'layouts.frontend')
@section('content')
@php
$contact = getContent('contact_us.content',true);
$user = auth()->user();
@endphp
<!-- ==================== Contact Form & Map Start ==================== -->
<section class="contact py-80">
    <div class="shape">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape6.png') }}" alt="@lang('shape')">
    </div>
    <div class="container">
        <div class="row gy-4">
            <div class="col-xl-8 col-lg-7 thumb">
                <div>
                    <img src="{{ getImage(getFilePath('contact_us') .'/'. @$contact->data_values->theme_five_contact_image) }}"
                    class="img-fiuld d-flex ms-auto" alt="@lang('image')">
                </div>
                <div class="row gy-5 mt-2">
                    <div class="col-xl-4 col-lg-4 col-md-6 col-12">
                        <div class="card">
                            <div class="icon">
                                <i class="fas fa-phone"></i>
                            </div>
                            <div class="content">
                                <h5>@lang('Phone Number')</h4>
                                <a href="{{@$contact->data_values->contact_number}}">{{@$contact->data_values->contact_number}}</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-12">
                        <div class="card">
                            <div class="icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="content">
                                <h5>@lang('Email address')</h4>
                                <a href="{{@$contact->data_values->email_address}}">{{@$contact->data_values->email_address}}</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-12">
                        <div class="card">
                            <div class="icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="content">
                                <h5>@lang('Our Location')</h4>
                                <p>{{__(@$contact->data_values->contact_details)}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-lg-5">
                <form method="post" action="" class="verify-gcaptcha form-area">
                    @csrf
                    <h4 class="contact__title">@lang('Contact us')</h4>
                    <div class="row gy-md-4 gy-3">
                        <div class="col-sm-12">
                            <h6 class="mb-2">@lang('Name')</h6>
                            <input type="text" name="name" id="name" class="form-control form--control"
                                placeholder="@lang('Name')" value="{{ old('name', @$user->fullname) }}" required
                                @if(@$user) readonly @endif>
                        </div>
                        <div class="col-sm-12">
                            <h6 class="mb-2">@lang('Email')</h6>
                            <input type="email" name="email" id="email" class="form-control form--control"
                                placeholder="@lang('Email')" value="{{ old('email', @$user->email) }}" require
                                @if(@$user) readonly @endif>
                        </div>
                        <div class="col-sm-12">
                            <h6 class="mb-2">@lang('Subject')</h6>
                            <input type="text" name="subject" id="msg_subject" class="form-control form--control"
                                placeholder="@lang('Subject')" required>
                        </div>
                        <div class="col-sm-12">
                            <h6 class="mb-2">@lang('Message')</h6>
                            <textarea class="form--control" name="message"
                                placeholder="@lang('Write Your Message')">{{ old('message') }}</textarea>
                        </div>
                        <div class="col-sm-12">
                            <x-captcha></x-captcha>
                        </div>
                        <div class="col-sm-12">
                            <button class="btn--base" id="recaptcha">@lang('Send Message')</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- ==================== Contact Form & Map End ==================== -->
@endsection

