@php
    $blog = getContent('blog.content',true);
    $blogs = getContent('blog.element',false,3);
@endphp
<!-- ==================== Blog Start Here ==================== -->
<section class="blog py-80">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="section-heading  text-center">
                    <span class="subtitle">{{__(@$blog->data_values->top_heading)}}</span>
                    <h2 class="section-heading__title">
                        {{__(@$blog->data_values->heading)}}
                         <span class="animate-shape center">
                             <img src="{{asset($activeTemplateTrue.'images/animate-shape.png')}}" alt="@lang('image')">
                         </span>
                    </h2>
                    <p class="section-heading__desc mb-30">{{__(@$blog->data_values->sub_heading)}}</p>
                </div>
            </div>
        </div>
        @include($activeTemplate.'components.blog')
    </div>
</section>
<!-- ==================== Blog End Here ==================== -->
