@php
    $chooseUs = getContent('theme_four_choose_us.content',true);
    $chooseUsElements = getContent('theme_four_choose_us.element',false,4);
@endphp
<!--========================== Why choose Start ==========================-->
<section class="why-choose py-80">

    <div class="shape">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape7.png') }}" alt="@lang('shape')">
    </div>
    <div class="shape2">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape8.png') }}" alt="@lang('shape')">
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-12 my-auto thumb mb-lg-0 mb-md-0 mb-5">
                <div class="row gy-4 mt-2">
                    @foreach($chooseUsElements as $item)
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="card">
                            <div class="icon icon1">
                               @php echo @$item->data_values->icon; @endphp
                            </div>
                            <h6>
                                @if(strlen(__(@$item->data_values->title)) >50)
                                {{substr(__(@$item->data_values->title), 0,50).'...' }}
                                @else
                                {{__(@$item->data_values->title)}}
                                @endif
                            </h6>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            <div class="col-lg-5 col-12 my-auto mt-5 mt-lg-0">
                <div class="title">
                    <h6>{{__(@$chooseUs->data_values->top_heading)}}</h6>
                    <h4>{{__(@$chooseUs->data_values->heading)}}</h4>
                    <p>{{__(@$chooseUs->data_values->sub_heading)}}</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--========================== Why choose End ==========================-->
