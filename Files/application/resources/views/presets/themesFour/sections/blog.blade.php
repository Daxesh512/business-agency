@php
$blog = getContent('blog.content',true);
$blogs = getContent('blog.element',false,4);
@endphp
<!-- ==================== Blog Start ==================== -->
<section class="blog py-80">
    <div class="shape2">
       <img src="{{ asset($activeTemplateTrue .'images/shape/shape6.png') }}" alt="@lang('shape')">
    </div>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div class="title">
                <h4>{{__(@$blog->data_values->heading)}}</h4>
                <p>{{__(@$blog->data_values->sub_heading)}}</p>
            </div>
            <div class="d-lg-block d-none">
                <a href="{{route('blog')}}" class="icon"><i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
        @include($activeTemplate.'components.blog')
    </div>
</section>
<!-- ==================== Blog End ==================== -->
