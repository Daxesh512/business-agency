@php
    $service = getContent('service.content',true);
    $services = App\Models\Service::where('status',1)->latest()->take(6)->get();
@endphp
<!-- ==================== Service Start Here ==================== -->
<section class="service-area section-bg py-80 ">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="section-heading  text-center">
                    <span class="subtitle">{{__(@$service->data_values->top_heading)}}</span>
                    <h2 class="section-heading__title">{{__(@$service->data_values->heading)}}</h2>
                    <p class="section-heading__desc">{{__(@$service->data_values->sub_heading)}}</p>
                </div>
            </div>
        </div>
        @include($activeTemplate.'components.service')
    </div>
</section>
<!-- ==================== Service End Here ==================== -->
