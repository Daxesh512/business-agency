@php
    $about = getContent('theme_five_about.content',true);
    $aboutElements = getContent('theme_five_about.element',false,3);
@endphp
<!--========================== About Start ==========================-->
<section class="about py-100 bg-img" data-background="{{ asset($activeTemplateTrue .'images/about_bg.png') }}">
    <div class="shape1">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape5.png') }}" alt="@lang('shape')">
    </div>
    <div class="shape2 d-lg-block d-none">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape6.png') }}" alt="@lang('shape')">
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-12 my-auto thumb">
               <div class="d-flex justify-content-center justify-content-lg-start">
                <img src="{{getImage(getFilePath('frontend').'/theme_five_about'.'/'.@$about->data_values->about_image)}}" alt="@lang('image')">
                <div class="experience">
                    <h1>{{$about->data_values->experience_count??0}}</h1>
                    <p>@lang('Years of excelence')</p>
                </div>
               </div>
            </div>
            <div class="col-lg-5 col-12 my-auto">
                <div class="title mt-3 mt-lg-0">
                    <h6>{{__(@$about->data_values->top_heading)}}</h6>
                    <h4>{{__(@$about->data_values->heading)}}</h4>
                    <p>{{__(@$about->data_values->short_description)}}</p>
                </div>
                <div class="info">
                    @foreach($aboutElements as $item)
                    <p>{{__($item->data_values->content)}}</p>
                    @endforeach
                </div>
                <div>
                    <a href="{{route('user.login')}}" class="btn btn--base">@lang('Discover More')</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!--========================== About End ==========================-->
