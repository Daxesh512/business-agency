@extends($activeTemplate.'layouts.frontend')
@section('content')
@php
    $banner = getContent('theme_four_banner.content', true);
    $highlightedText = $banner->data_values->highlighted_heading_text;
@endphp

<!--========================== Banner Section Start ==========================-->
<section class="banner-section">
    <div class="banner-thumb">
        <div class="shape1">
            <img src="{{ asset($activeTemplateTrue .'images/shape/shape1.png') }}" alt="@lang('shape')">
        </div>
        <div class="shape2">
            <img src="{{ asset($activeTemplateTrue .'images/shape/shape2.png') }}" alt="@lang('shape')">
        </div>
        <div class="shape3">
            <img src="{{ asset($activeTemplateTrue .'images/shape/shape3.png') }}" alt="@lang('shape')">
        </div>
        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-6 col-12 my-auto">
                    <div class="content">
                        <h5>{{__(@$banner->data_values->top_heading)}}</h5>
                        <h3>
                            {!! str_replace(__(@$highlightedText),"<span class='text--base'>$highlightedText</span>",__(@$banner->data_values->heading) )!!}
                        </h3>
                        <p>
                            @if(strlen(__(@$banner->data_values->sub_heading)) >125)
                            {{substr(__(@$banner->data_values->sub_heading), 0,125).'...' }}
                            @else
                            {{__(@$banner->data_values->sub_heading)}}
                            @endif
                        </p>
                    </div>
                    <div class="d-flex play-action">
                        <div>
                            <a href="{{route('contact')}}" class="btn--base">@lang('Contact Us')</a>
                        </div>
                        <div class="video-wrapper mt-1 mx-5">
                            <a class="video-icon" data-rel="lightcase:myCollection"
                                href="{{@$banner->data_values->embedded_link}}">
                                <i class="fas fa-play"></i>
                            </a>
                        </div>
                    </div>
                    <div class="d-flex client_banner">
                        <div>
                            <img src="{{getImage(getFilePath('frontend').'/theme_four_banner'.'/'.@$banner->data_values->users_image)}}" alt="@lang('image')">
                        </div>
                        <div class="mx-3">
                            <h4>{{__(@$banner->data_values->users_count)}}</h4>
                            <p>{{__(@$banner->data_values->users_title)}}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-12 thumb">
                    <div class="shape4">
                        <img src="{{ asset($activeTemplateTrue .'images/shape/banners.png') }}" alt="@lang('shape')">
                    </div>
                    <img src="{{getImage(getFilePath('frontend').'/theme_four_banner'.'/'.@$banner->data_values->banner_image)}}" alt="@lang('image')" class="d-flex mx-auto">
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

