@php
    $portfolio = getContent('portfolio.content',true);
    $portfolios = App\Models\Portfolio::where('status',1)->latest()->limit(6)->get();
@endphp
<!--========================== Portfolio End ==========================-->
<section class="portfolio py-100">
    <div class="container">
        <div class="title d-flex justify-content-between">
            <div>
            <h6>{{__(@$portfolio->data_values->top_heading)}}</h6>
            <h4>{{__(@$portfolio->data_values->heading)}}</h4>
            </div>
            <div class="d-lg-block d-none">
                <p>{{__(@$portfolio->data_values->sub_heading)}}</p>
            </div>
        </div>
        @include($activeTemplate.'components.portfolio')
    </div>
</section>
<!--========================== Portfolio End ==========================-->
