<!-- meta tags and other links -->
<!-- Header -->
<!doctype html>
<html lang="{{ config('app.locale') }}" itemscope itemtype="http://schema.org/WebPage">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> {{ $general->siteName(__($pageTitle)) }}</title>
    @include('includes.seo')

   <!-- Bootstrap CSS -->
   <link href="{{ asset('assets/common/css/bootstrap.min.css') }}" rel="stylesheet">
   <link href="{{ asset('assets/common/css/all.min.css') }}" rel="stylesheet">
   <link rel="stylesheet" href="{{asset('assets/common/css/line-awesome.min.css')}}">
   <link rel="stylesheet" href="{{asset($activeTemplateTrue.'css/custom-animation.css')}}">
   <link rel="stylesheet" href="{{asset($activeTemplateTrue.'css/odometer.css')}}">

   <link href="{{ asset('assets/landing/main.css') }}" rel="stylesheet">

</head>
<body>

<!--==================== Preloader Start ====================-->
<div id="loading">
   <div id="loading-center">
         <div id="loading-center-absolute">
            <div class="loader">
               <div class="loader__bar"></div>
               <div class="loader__bar"></div>
               <div class="loader__bar"></div>
               <div class="loader__bar"></div>
               <div class="loader__bar"></div>
               <div class="loader__ball"></div>
            </div>
         </div>
   </div>
</div>
<!--==================== Preloader End ====================-->

<!--==================== Overlay Start ====================-->
<div class="body-overlay"></div>
<!--==================== Overlay End ====================-->

<!--==================== Sidebar Overlay End ====================-->
<div class="sidebar-overlay"></div>
<!--==================== Sidebar Overlay End ====================-->

<!-- ==================== Scroll to Top End Here ==================== -->
<a class="scroll-top"><i class="fas fa-angle-double-up"></i></a>
<!-- ==================== Scroll to Top End Here ==================== -->


<!--========================== Header section Start ==========================-->
<div class="header-main-area">
    <div class="header" id="header">
        <div class="container-fluid position-relative">
            <div class="row">
                <div class="header-wrapper">

                    <div class="logo-wrapper">
                        <a href="{{route('landing')}}" class="normal-logo"> <img src="{{ getImage(getFilePath('logoIcon').'/logo.png', '?'
                            .time()) }}" alt="{{config('app.name')}}"></a>
                        <a href="{{route('landing')}}" class="dark-logo hidden"> <img src="{{ getImage(getFilePath('logoIcon').'/logo_white.png', '?'
                            .time()) }}" alt="{{config('app.name')}}"></a>
                    </div>


                    <div class="menu-wrapper">
                        <ul class="main-menu">
                            <li><a class='active' href="#demo-light">@lang('Demo Light')</a></li>
                            <li><a href="#demo-dark">@lang('Demo Dark')</a></li>
                            <li><a href="#inner-page">@lang('Inner Pages')</a></li>
                            <li><a href="https://codecanyon.net/user/wstacks">@lang('Support')</a></li>
                        </ul>
                    </div>

                    <div class="menu-right-wrapper">
                        <ul>
                            <li>
                                <div class="light-dark-btn-wrap ms-1" id="light-dark-checkbox">
                                    <i class="fas fa-moon mon-icon"></i>
                                    <i class='fas fa-sun sun-icon'></i>
                                </div>
                            </li>
                            <li><a class='btn btn--base' target="_blank" href="https://codecanyon.net/item/finbiz-multipurpose-business-agency-platform/45118889">@lang('Purchase Now') <i class="fas fa-arrow-right"></i></a></li>
                            <li><i class="fas fa-bars sidebar-menu-show-hide"></i></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!--========================== Header section End ==========================-->

 <!--========================== Sidebar mobile menu wrap Start ==========================-->
<div class="sidebar-menu-wrapper">
    <div class="top-close d-flex align-items-center justify-content-between">
        <div class="header-wrapper">
            <div class="logo-wrapper ms-3 mb-1">
                <div class="logo-wrapper">
                    <a href="{{route('landing')}}" class="normal-logo" id="normal-logo"> <img src="{{ getImage(getFilePath('logoIcon').'/logo.png', '?'
                        .time()) }}" alt="{{config('app.name')}}"></a>
                    <a href="{{route('landing')}}" class="dark-logo hidden" id="dark-logo"> <img src="{{ getImage(getFilePath('logoIcon').'/logo_white.png', '?'
                        .time()) }}" alt="{{config('app.name')}}"></a>
                </div>
            </div>
        </div>
        <i class="fa-solid fa-xmark close-hide-show"></i>
    </div>
    <ul class="sidebar-menu-list">
        <li class="sidebar-menu-list__item active">
            <a  href="#demo-light" class="sidebar-menu-list__link"> @lang('Demo Light')</a>
        </li>
        <li class="sidebar-menu-list__item">
            <a href="#demo-dark" class="sidebar-menu-list__link">@lang('Demo Dark')</a>
        </li>
        <li class="sidebar-menu-list__item ">
            <a  href="#inner-page" class="sidebar-menu-list__link"> @lang('Inner Pages')</a>
        </li>
        <li class="sidebar-menu-list__item ">
            <a class="btn btn--base mt-2 mb-2 ms-3" href="https://codecanyon.net/user/wstacks"> @lang('Purchase Now') <i class="fas fa-arrow-right"></i></a>
        </li>
    </ul>
</div>
<!--========================== Sidebar mobile menu wrap End ==========================-->

<!--========================== Banner Section Start ==========================-->
<!-- bg-img -->
<section class="banner-section bg-img">
    <span class="banner-effect shape-1 animate-zoom-fade"></span>
    <span class="banner-effect shape-2 animate-zoom-fade"></span>
    <span class="banner-effect shape-3 animate-zoom-fade"></span>
    <img class="dark animate-y-axis"  src="{{asset('assets/landing/images/banner-light.jpg')}}" alt="banner-light">
    <img class="Light animate-y-axis" src="{{asset('assets/landing/images/banner-dark.jpg')}}" alt="banner-dark">

    <div class="container-fluid">
            <div class="row gy-4 justify-content-center align-items-center">
                <div class="col-xl-4 col-lg-5 col-md-8 col-sm-8">
                    <div class="banner-thumb">
                        <div class="banner-thumb__text text-center">
                            <h2 class="version">@lang('1.3.0')</h2>
                            <h2 class="title">@lang('Great Choice For Business Agencies').</h2>
                        </div>
                    </div>
                    <div class="experience-wrap d-flex justify-content-center">
                        <div class="experience">
                            <div class="experience__icon">
                                <h3><span class="odometer" data-count="6">@lang('00')</span></h3>
                            </div>
                            <div class="experience__content">
                                <h3 class="title">@lang('Templates')</h3>
                            </div>
                        </div>
                        <div class="experience">
                            <div class="experience__icon">
                                <h3><span class="odometer" data-count="18">@lang('00')</span></h3>
                            </div>
                            <div class="experience__content">
                                <h3 class="title">@lang('Inner Pages')</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</section>
<!--========================== Banner Section End ==========================-->

<!-- ==================== Light Start Here ==================== -->
<section id="demo-light" class="item-area py-80 ">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="section-heading  text-center">
                    <h2 class="section-heading__title"> @lang('3 Awesome Light Template').</h2>
                </div>
            </div>
        </div>
        <div class="row gy-4 justify-content-center">
            <div class="col-lg-4 col-md-6">
                <h2 class="item-box-title"><a target="_blank" href="{{url('/').'?template=default'}}">@lang('Template One')</a></h2>
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a target="_blank" href="{{url('/').'?template=default'}}">
                            <img src="{{asset('assets/landing/images/templete-light-1.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <h2 class="item-box-title"><a target="_blank" href="{{url('/').'?template=themesTwo'}}">@lang('Template Two')</a></h2>
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a target="_blank" href="{{url('/').'?template=themesTwo'}}">
                            <img src="{{asset('assets/landing/images/templete-light-2.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <h2 class="item-box-title"><a target="_blank" href="{{url('/').'?template=themesThree'}}">@lang('Template Three')</a></h2>
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a target="_blank" href="{{url('/').'?template=themesThree'}}">
                            <img src="{{asset('assets/landing/images/templete-light-3.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==================== Light End Here ==================== -->

<!-- ==================== Dark Start Here ==================== -->
<section id="demo-dark" class="item-area section-bg py-80 ">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="section-heading  text-center">
                    <h2 class="section-heading__title">@lang('3 Awesome Dark Template').</h2>
                </div>
            </div>
        </div>
        <div class="row gy-4 justify-content-center">
            <div class="col-lg-4 col-md-6">
                <h2 class="item-box-title"><a target="_blank" href="{{url('/').'?template=default'}}">@lang('Template One')</a></h2>
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a target="_blank" href="{{url('/').'?template=default'}}">
                            <img src="{{asset('assets/landing/images/templete-dark-1.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <h2 class="item-box-title"><a target="_blank" href="{{url('/').'?template=themesTwo'}}">@lang('Template Two')</a></h2>
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a target="_blank" href="{{url('/').'?template=themesTwo'}}">
                            <img src="{{asset('assets/landing/images/templete-dark-2.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <h2 class="item-box-title"><a target="_blank" href="{{url('/').'?template=themesThree'}}">@lang('Template Tree')</a></h2>
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a target="_blank" href="{{url('/').'?template=themesThree'}}">
                            <img src="{{asset('assets/landing/images/templete-dark-3.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==================== Dark End Here ==================== -->

<!-- ==================== Inner Start Here ==================== -->
<section id="inner-page" class="item-area section-bg py-80 ">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="section-heading  text-center">
                    <h2 class="section-heading__title">@lang('Awesome Inner Pages').</h2>
                </div>
            </div>
        </div>
        <div class="row gy-4 justify-content-center">
            <div class="col-lg-4 col-md-6">
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a href="{{route('home')}}">
                            <img src="{{asset('assets/landing/images/inner-1.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a href="{{route('home')}}">
                        <img src="{{asset('assets/landing/images/inner-2.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a href="{{route('home')}}">
                        <img src="{{asset('assets/landing/images/inner-3.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a href="{{route('home')}}">
                            <img src="{{asset('assets/landing/images/inner-4.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a href="{{route('home')}}">
                        <img src="{{asset('assets/landing/images/inner-5.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="item-box">
                    <div class="item-box__thumb">
                       <a href="{{route('home')}}">
                        <img src="{{asset('assets/landing/images/inner-6.jpg')}}" alt="image">
                       </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==================== Inner End Here ==================== -->


<!-- Footer -->
@php
$contact = getContent('contact_us.content',true);
@endphp
<!-- ==================== Footer Start Here ==================== -->
<footer class="footer-area section-bg-light bg-img" style="background-image: url({{asset('assets/landing/images/footer-bg.jpg')}})">
    <!-- bottom Footer -->
    <div class="bottom-footer section-bg py-3">
        <div class="container">
            <div class="row gy-2 justify-content-center">
                <div class="col-lg-6 col-md-12">
                    <div class="bottom-footer-text text-center">@php echo $contact->data_values->website_footer @endphp</div>
                </div>
            </div>
        </div>
    </div>
</footer>
  <!-- ==================== Footer End Here ==================== -->


  <script src="{{asset('assets/common/js/jquery-3.7.0.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/popper.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/bootstrap.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/jquery.appear.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/odometer.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/viewport.jquery.js')}}"></script>
 <!-- main js -->
 <script src="{{ asset('assets/landing/main.js') }}"></script>

</body>
</html>
