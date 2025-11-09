@php
$counter = getContent('theme_five_counter.content',true);
$counterElements = getContent('theme_five_counter.element',false,4);
@endphp

<!-- ==================== Experience start ==================== -->
<section class="experience py-100 bg-img" data-background="{{ asset($activeTemplateTrue .'images/ex_bg.png') }}">
    <div class="shape1">
        <svg width="104" height="95" viewBox="0 0 104 95" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 0L104 95H0V0Z"  />
        </svg>
    </div>
    <div class="shape2">
        <svg width="104" height="95" viewBox="0 0 104 95" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M104 95L0 0H104V95Z" />
        </svg>
    </div>
    <div class="container">
        <div class="row">
            @foreach($counterElements as $item)
            <div class="col-xl-3 col-lg-4 col-md-6 col-12">
                <div class="counterup-item">
                    <h3><span class="odometer"
                            data-odometer-final="{{@$item->data_values->counter_digit}}">1</span>{{@$item->data_values->symbol}}
                    </h3>
                    <p>{{__(@$item->data_values->title)}}</p>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!-- ==================== Experience end ==================== -->
