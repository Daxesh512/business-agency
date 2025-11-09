@php
    $portfolio = getContent('theme_three_portfolio.content',true);
    $portfolios = App\Models\Portfolio::where('status',1)->limit(6)->get();
@endphp

<!-- ==================== Our Projects Start Here ==================== -->
<section class="projects-area section-bg py-80">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <div class="section-heading">
                <span class="subtitle">{{__(@$portfolio->data_values->top_heading)}}</span>
                    <h2 class="section-heading__title">{{__(@$portfolio->data_values->heading)}}</h2>
                    <p class="section-heading__desc mb-3">{{__(@$portfolio->data_values->sub_heading)}}</p>
                </div>
            </div>
        </div>
        @include($activeTemplate.'components.portfolio')
    </div>
</section>
<!-- ==================== Our Projects us End Here ==================== -->
