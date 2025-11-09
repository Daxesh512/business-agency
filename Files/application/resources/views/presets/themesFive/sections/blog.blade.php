@php
$blog = getContent('blog.content',true);
$blogs = getContent('blog.element',false,3);
@endphp
<!-- ==================== Blog Start ==================== -->
<section class="blog py-80">
    <div class="shape2">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape6.png') }}" alt="@lang('shape')">
    </div>
    <div class="container">
        <div class="title">
            <h6>{{__(@$blog->data_values->top_heading)}}</h6>
            <h4>{{__(@$blog->data_values->heading)}}</h4>
            <p>{{__(@$blog->data_values->sub_heading)}}</p>
        </div>
        @include($activeTemplate.'components.blog')
    </div>
</section>
<!-- ==================== Blog End ==================== -->
