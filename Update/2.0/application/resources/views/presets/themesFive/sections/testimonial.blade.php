@php
    $testimonial = getContent('testimonial.content',true);
    $testimonialElements = getContent('testimonial.element',false);
@endphp

<!--========================== Testimonial Start ==========================-->
<section class="testimonial py-100">
    <div class="shape d-lg-block d-none">
        <svg width="493" height="560" viewBox="0 0 493 560" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M14.8814 74.1128H130.783L72.8337 174.491L14.8814 74.1128Z" />
            <path d="M-57.5581 182.858L0.394218 82.4766L58.3438 182.858H-57.5581Z" />
            <path d="M-57.5581 199.586H58.3438L0.394218 299.968L-57.5581 199.586Z" />
            <path d="M87.3286 199.586H203.23L145.278 299.968L87.3286 199.586Z" />
            <path d="M348.113 199.586L290.164 299.968L232.203 199.586H348.113Z" />
            <path d="M420.559 308.333H304.648L362.606 207.954L420.559 308.333Z" />
            <path d="M159.772 308.333L217.724 207.954L275.674 308.333H159.772Z" />
            <path d="M72.8337 207.954L130.783 308.333H14.8814L72.8337 207.954Z" fill="#FFB41D" />
            <path d="M72.8337 -43L130.783 57.3814H14.8814L72.8337 -43Z" fill="#FFB41D" />
            <path d="M14.8814 325.063H130.783L72.8337 425.442L14.8814 325.063Z" />
            <path d="M275.674 325.063L217.724 425.442L159.772 325.063H275.674Z" fill="#FFB41D" />
            <path d="M362.606 425.442L304.648 325.063H420.559L362.606 425.442Z" />
            <path d="M493 433.809H377.09L435.042 333.428L493 433.809Z" />
            <path d="M203.23 433.809H87.3286L145.278 333.428L203.23 433.809Z" />
            <path d="M58.3438 450.537L0.394218 550.919L-57.5581 450.537H58.3438Z" fill="#FFB41D" />
            <path d="M203.23 450.537L145.278 550.919L87.3286 450.537H203.23Z" />
            <path d="M130.783 559.286H14.8814L72.8337 458.904L130.783 559.286Z" />
        </svg>
    </div>
    <div class="shape2">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape9.png') }}" alt="@lang('shape')">
    </div>
    <div class="container">
        <div class="title">
            <h6>{{__(@$testimonial->data_values->top_heading)}}</h6>
            <h4>{{__(@$testimonial->data_values->heading)}}</h4>
            <p>{{__(@$testimonial->data_values->sub_heading)}}</p>
        </div>
        <div class="testimonial-slider mt-3">
            @foreach ($testimonialElements as $item)
            <div class="card">
                <div class="profile d-flex">
                    <div>
                        <img src="{{getImage(getFilePath('frontend').'/testimonial'.'/'.@$item->data_values->testimonial_image)}}" alt="@lang('image')">
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
                        @if(strlen(__(@$item->data_values->description)) >180)
                        {{substr(__(@$item->data_values->description), 0,180).'...' }}
                        @else
                        {{__(@$item->data_values->description)}}
                        @endif
                    </p>
                </div>
                <div class="star">
                    @php
                     echo showRatings($item->data_values->star_count);
                    @endphp
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!--========================== Testimonial End ==========================-->
