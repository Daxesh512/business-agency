@extends($activeTemplate.'layouts.frontend')
@section('content')
@php
    $banner = getContent('banner.content', true);
@endphp
<!--========================== Banner Section Start ==========================-->
<!-- bg-img -->
<section class="banner-section bg-img">
    <span class="banner-effect-2"></span>
    <div class="popup-vide-wrap">
      <div class="video-main">
          <div class="promo-video">
              <div class="waves-block">
                  <div class="waves wave-1"></div>
                  <div class="waves wave-2"></div>
                  <div class="waves wave-3"></div>
              </div>
          </div>
      </div>
    </div>

    <div class="container">
        <div class="row gy-4 align-items-center">
            <div class="col-lg-6 col-md-6">
                  <div class="banner-left__content">
                    <span class="subtitle">{{__(@$banner->data_values->top_heading)}}</span>
                      <h2>{{__(@$banner->data_values->heading)}}</h2>
                      <p>
                        @if(strlen(__(@$banner->data_values->sub_heading)) >180)
                            {{substr( __(@$banner->data_values->sub_heading), 0,180).'...' }}
                        @else
                            {{__(@$banner->data_values->sub_heading)}}
                        @endif
                    </p>
                      <a href="{{url('/plan')}}" class="btn btn--base me-2 mb-2">
                          @lang('Get Started') <i class="fa-sharp fas fa-arrow-right"></i>
                      </a>
                      <a href="{{url('/contact')}}" class="btn btn--base outline mb-2">
                          @lang('Contact Us') <i class="far fa-id-card"></i>
                      </a>
                  </div>
              </div>
            <div class="col-lg-6 col-md-6">
              <div class="banner-right-wrap">
                  <img src="{{getImage(getFilePath('banner').'/'.@$banner->data_values->banner_image)}}" alt="@lang('image')">
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

