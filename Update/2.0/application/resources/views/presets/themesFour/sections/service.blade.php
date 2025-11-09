@php
    $service = getContent('service.content',true);
    $services = App\Models\Service::where('status',1)->latest()->limit(6)->get();
@endphp

<!-- ==================== Services start ==================== -->
<section class="services py-80">
    <div class="shape">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape4.png') }}" alt="@lang('shape')">
    </div>
    <div class="container">
        <div class="title">
            <h6>{{__(@$service->data_values->top_heading)}}</h6>
            <h4>{{__(@$service->data_values->heading)}}</h4>
            <p>{{__(@$service->data_values->sub_heading)}}</p>
        </div>
        @include($activeTemplate.'components.service')
    </div>
</section>
<!-- ==================== Services end ==================== -->
