@php
    $about = getContent('theme_four_about.content',true);
    $aboutElements = getContent('theme_four_about.element',false,3);
@endphp

<!--========================== About Start ==========================-->
<section class="about py-80">

    <div class="shape">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape5.png') }}" alt="@lang('shape')">
    </div>
    <div class="shape2">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape6.png') }}" alt="@lang('shape')">
    </div>

    <div class="container">
        <div class="row gy-4">
            <div class="col-lg-5 col-12 my-auto">
                <div class="title">
                    <h6>{{__(@$about->data_values->top_heading)}}</h6>
                    <h4>{{__(@$about->data_values->heading)}}</h4>
                    <p>{{__(@$about->data_values->short_description)}}</p>
                </div>

                @foreach($aboutElements as $item)
                <div class="details">
                    <div class="d-flex">
                        <div class="icon">
                            @php echo @$item->data_values->icon; @endphp
                        </div>
                        <div class="content">
                            <h5>{{__(@$item->data_values->title)}}</h5>
                            <p>
                                @if(strlen(__(@$item->data_values->content)) >75)
                                {{substr(__(@$item->data_values->content), 0,75).'...' }}
                                @else
                                {{__(@$item->data_values->content)}}
                                @endif
                            </p>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            <div
                class="col-lg-7 col-12 my-auto thumb mt-lg-0 mt-5 justify-content-center justify-content-lg-start d-flex">
                <img src="{{getImage(getFilePath('frontend').'/theme_four_about'.'/'.@$about->data_values->about_image)}}" alt="@lang('image')">
            </div>
        </div>
    </div>
</section>
<!--========================== About End ==========================-->
