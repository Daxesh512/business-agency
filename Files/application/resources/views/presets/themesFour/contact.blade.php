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
            <div class="col-lg-5 my-auto">
               <div class="contact-body">
                <h4 class="contact__title">{{__($contact->data_values->title)}}</h4>
                <form method="post" action="" class="verify-gcaptcha">
                    @csrf
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
            <div class="col-lg-7 my-auto thumb mt-4">
                <div>
                    <img src="{{ getImage(getFilePath('contact_us') .'/'. @$contact->data_values->theme_four_contact_image) }}"
                        class="img-fiuld d-flex mx-auto" alt="@lang('image')">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==================== Contact Form & Map End ==================== -->
@endsection
