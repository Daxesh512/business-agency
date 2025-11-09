@extends($activeTemplate.'layouts.frontend')
@section('content')
@php
    $banner = getContent('theme_three_banner.content', true);
@endphp

<!--========================== Banner Section Start ==========================-->
<!-- bg-img -->
<section class="banner-section bg-img">
    <span class="banner-effect shape-1 animate-zoom-fade"></span>
    <span class="banner-effect shape-2 animate-zoom-fade"></span>
    <span class="banner-effect shape-3 animate-zoom-fade"></span>

    <div class="container">
        <div class="row gy-4 align-items-center">
            <div class="col-lg-6">
                  <div class="banner-left__content">
                    <span class="subtitle">{{__(@$banner->data_values->top_heading)}}</span>
                      <h2>{{__(@$banner->data_values->heading)}}</h2>
                      <p>
                        @if(strlen(__(@$banner->data_values->sub_heading)) >180)
                        {{substr(__(@$banner->data_values->sub_heading), 0,180).'...' }}
                        @else
                        {{__(@$banner->data_values->sub_heading)}}
                        @endif
                    </p>
                      <a href="{{url('/plan')}}" target="_blank" class="btn btn--base me-2 mb-2">
                        @lang('Get Started')  <i class="fa-sharp fas fa-arrow-right"></i>
                      </a>
                      <a href="{{url('/contact')}}" target="_blank" class="btn btn--base outline mb-2">
                        @lang('Contact Us') <i class="far fa-id-card"></i>
                      </a>
                  </div>
              </div>
            <div class="col-lg-6">
              <div class="banner-right-wrap position-relative">

                <div class="experience-text animate-y-axis">
                  <h4>{{$banner->data_values->experience}}</h4>
                  <span>@lang('Years Of Experience')</span>
              </div>
              <img src="{{getImage(getFilePath('ThemeThreeBanner').'/'.@$banner->data_values->banner_image)}}" alt="Banner Image">
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

