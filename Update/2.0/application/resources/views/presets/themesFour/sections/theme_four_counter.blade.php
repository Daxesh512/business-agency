@php
    $counter = getContent('theme_four_counter.content',true);
    $counterElements = getContent('theme_four_counter.element',false,4);
@endphp

<!-- ==================== Experience start ==================== -->
<section class="experience py-80">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-12 my-auto">
                <div class="content">
                    <h3>{{__(@$counter->data_values->heading)}}</h3>
                    <p>{{__(@$counter->data_values->sub_heading)}}</p>
                    <div>
                        <a href="{{route('contact')}}" class="btn--base">@lang('Explore')</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 col-12 mt-5 mt-lg-0">
                <div class="row">
                    @foreach($counterElements as $item)
                    <div class="col-lg-6 col-12">
                        <div class="counterup-item">
                            <h3>
                                <span class="odometer" data-odometer-final="{{@$item->data_values->counter_digit}}">0</span>
                            </h3>
                            <h5>{{__(@$item->data_values->title)}}</h5>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==================== Experience end ==================== -->
