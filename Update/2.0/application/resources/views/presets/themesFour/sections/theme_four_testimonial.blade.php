@php
$testimonial = getContent('theme_four_testimonial.content',true);
$testimonialElements = getContent('theme_four_testimonial.element',false);
@endphp
<!--========================== Testimonial Start ==========================-->
<section class="testimonial py-80">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-12 mb-lg-0 mb-5 justify-content-center justify-content-lg-start d-flex">
                <div class="thumb">
                    <img src="{{getImage(getFilePath('frontend').'/theme_four_testimonial'.'/'.@$testimonial->data_values->testimonial_image)}}" alt="@lang('image')">
                </div>
            </div>
            <div class="col-lg-6 col-12 my-auto ">
                <div class="title">
                    <h6>{{__(@$testimonial->data_values->top_heading)}}</h6>
                    <h4>{{__(@$testimonial->data_values->heading)}}</h4>
                    <p>{{__(@$testimonial->data_values->sub_heading)}}</p>
                </div>
                <div class="testimonial-slider">
                    @foreach ($testimonialElements as $item)
                    <div class="card">
                        <div class="profile d-flex">
                            <div>
                                <img src="{{getImage(getFilePath('frontend').'/theme_four_testimonial'.'/'.@$item->data_values->client_image)}}" alt="@lang('image')">
                            </div>
                            <div>
                                <h5>{{__(@$item->data_values->name)}}</h5>
                                <p>
                                    @if(strlen(__(@$item->data_values->designation)) >30)
                                    {{substr(__(@$item->data_values->designation), 0,30).'...' }}
                                    @else
                                    {{__(@$item->data_values->designation)}}
                                    @endif
                                </p>
                            </div>
                        </div>
                        <div class="content">
                            <p>
                                @if(strlen(__(@$item->data_values->short_description)) >180)
                                {{substr(__(@$item->data_values->short_description), 0,180).'...' }}
                                @else
                                {{__(@$item->data_values->short_description)}}
                                @endif
                            </p>
                        </div>
                        <div class="star">
                            @php
                              echo showRatings($item->data_values->star_count);
                            @endphp
                        </div>
                        <div class="icon">
                            <i class="fas fa-quote-right"></i>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>
<!--========================== Testimonial End ==========================-->
