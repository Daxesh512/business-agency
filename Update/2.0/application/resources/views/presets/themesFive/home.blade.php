@extends($activeTemplate.'layouts.frontend')
@section('content')
@php
    $banner = getContent('theme_five_banner.content', true);
    $highlightedText = $banner->data_values->highlighted_heading_text;
@endphp

<!--========================== Banner Section Start ==========================-->
<section class="banner-section">
    <div class="banner-thumb bg-img" data-background="{{ asset($activeTemplateTrue .'images/banner_bg.png') }}">
        <div class="shape1 d-xl-block d-none">
            <svg viewBox="0 0 278 627" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g filter="url(#filter0_d_132_23510)">
                    <path d="M138.074 240.106L216.805 201.22L211.118 288.848L138.074 240.106Z" fill="#FFB41D" />
                    <path d="M125.353 338.28L131.04 250.649L204.083 299.394L125.353 338.28Z" />
                    <path d="M130.965 349.643L209.695 310.757L204.01 398.387L130.965 349.643Z" />
                    <path d="M229.385 301.032L308.115 262.146L302.428 349.777L229.385 301.032Z" />
                    <path d="M222.345 311.579L295.387 360.322L216.656 399.208L222.345 311.579Z" />
                    <path d="M138.147 141.11L211.191 189.855L132.46 228.741L138.147 141.11Z" />
                    <path d="M222.271 410.573L301.002 371.687L295.316 459.316L222.271 410.573Z" />
                    <path d="M386.698 421.25L307.968 460.136L313.653 372.506L386.698 421.25Z" />
                    <path d="M293.891 481.224L288.205 568.855L215.16 520.11L293.891 481.224Z" />
                    <path d="M379.585 530.791L300.855 569.677L306.542 482.046L379.585 530.791Z" />
                    <path d="M208.137 530.65L281.169 579.4L202.439 618.287L208.137 530.65Z" />
                </g>
                <defs>
                    <filter id="filter0_d_132_23510" x="121.354" y="141.11" width="466.182" height="485.177"
                        filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix" />
                        <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
                            result="hardAlpha" />
                        <feOffset dy="4" />
                        <feGaussianBlur stdDeviation="2" />
                        <feComposite in2="hardAlpha" operator="out" />
                        <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0" />
                        <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_132_23510" />
                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_132_23510" result="shape" />
                    </filter>
                </defs>
            </svg>
        </div>
        <div class="shape2 d-lg-block d-none">
            <svg viewBox="0 0 321 362" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M-41.234 88.7875H46.5762L2.67215 164.837L-41.234 88.7875Z" />
                <path d="M13.6527 183.85H101.463L57.5568 259.901L13.6527 183.85Z" />
                <path d="M211.23 183.85L167.326 259.901L123.414 183.85H211.23Z" />
                <path d="M266.117 266.238H178.301L222.211 190.189L266.117 266.238Z" />
                <path d="M68.5375 266.238L112.444 190.189L156.348 266.238H68.5375Z" />
                <path d="M2.67215 190.189L46.5762 266.238H-41.234L2.67215 190.189Z" />
                <path d="M2.67215 0.0600891L46.5762 76.1115H-41.234L2.67215 0.0600891Z" />
                <path d="M-41.234 278.914H46.5762L2.67215 354.963L-41.234 278.914Z" />
                <path d="M156.348 278.914L112.444 354.963L68.5375 278.914H156.348Z" fill="#FFB41D" />
                <path d="M222.211 354.963L178.301 278.914H266.117L222.211 354.963Z" />
                <path d="M321 361.302H233.184L277.09 285.251L321 361.302Z" />
                <path d="M101.463 361.302H13.6527L57.5568 285.251L101.463 361.302Z" />
            </svg>
        </div>
        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-6 col-12 my-auto">
                    <div class="content">
                        <h5>{{__(@$banner->data_values->top_heading)}}</h5>
                        <h1>
                            {!! str_replace(__(@$highlightedText),"<span class='text--base'>$highlightedText</span>",__(@$banner->data_values->heading) )!!}
                        </h1>
                    </div>
                    <div class="d-block d-md-flex d-lg-flex mt-4">
                        <div class="mb-lg-0 mb-3">
                            <a href="{{route('user.login')}}" class="btn--base">@lang('Discover')</a>
                        </div>
                        <div>
                            <a href="{{route('contact')}}" class="btn--base btn--base-two">@lang('Contact Us')</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="d-flex justify-content-md-center justify-content-lg-start">
                        <div class="thumb">
                            <div class="shape3">
                            </div>
                            <img src="{{getImage(getFilePath('frontend').'/theme_five_banner'.'/'.@$banner->data_values->banner_image)}}"  class="img-fluid" alt="@lang('image')">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--========================== Banner Section End ==========================-->
@if($sections->secs != null)
@foreach(json_decode($sections->secs) as $sec)
@include($activeTemplate.'sections.'.$sec)
@endforeach
@endif

@endsection

