@php
    $plan = getContent('plan.content',true);
    $plans = App\Models\Plan::where('status',1)->latest()->limit(3)->get();
@endphp
<!--========================== Plan Start ==========================-->
<section class="plan py-80">
    <div class="shape">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape6.png') }}" alt="@lang('shape')">
    </div>
    <div class="container">
        <div class="title">
            <h6>{{__(@$plan->data_values->top_heading)}}</h6>
            <h4>{{__(@$plan->data_values->heading)}}</h4>
            <p>{{__(@$plan->data_values->sub_heading)}}</p>
        </div>
        @include($activeTemplate.'components.plan')
    </div>
</section>
<!--========================== Plan End ==========================-->
