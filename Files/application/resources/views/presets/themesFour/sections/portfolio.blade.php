@php
$portfolio = getContent('portfolio.content',true);
$portfolios = App\Models\Portfolio::where('status',1)->latest()->limit(8)->get();
@endphp

<!--========================== Portfolio End ==========================-->
<section class="portfolio py-80">
    <div class="container">
        <div class="title">
            <h6>{{__(@$portfolio->data_values->top_heading)}}</h6>
            <h4>{{__(@$portfolio->data_values->heading)}}</h4>
            <p>{{__(@$portfolio->data_values->sub_heading)}}</p>
        </div>
        @include($activeTemplate.'components.portfolio')
    </div>
</section>
<!--========================== Portfolio End ==========================-->
