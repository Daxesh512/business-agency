@php
    $chooseUs = getContent('theme_five_choose_us.content',true);
    $chooseUsElements = getContent('theme_five_choose_us.element',false,4);
@endphp
<!-- ==================== why choose end ==================== -->
<section class="why-choose py-100 bg-img" data-background="{{ asset($activeTemplateTrue .'images/why-choose_bg.png') }}">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-12 my-auto">
                <div class="title">
                    <h6>{{__(@$chooseUs->data_values->top_heading)}}</h6>
                    <h4>{{__(@$chooseUs->data_values->heading)}}</h4>
                    <p>{{__(@$chooseUs->data_values->sub_heading)}}</p>
                </div>
                @foreach($chooseUsElements as $item)
                <div class="details">
                    <div class="d-flex">
                        <div class="icon">
                           @php echo @$item->data_values->icon; @endphp
                        </div>
                        <div class="content">
                            <h5>
                                @if(strlen(__(@$item->data_values->title)) >50)
                                {{substr(__(@$item->data_values->title), 0,50).'...' }}
                                @else
                                {{__(@$item->data_values->title)}}
                                @endif
                            </h5>
                            <p>
                                @if(strlen(__(@$item->data_values->content)) >150)
                                {{substr(__(@$item->data_values->content), 0,150).'...' }}
                                @else
                                {{__(@$item->data_values->content)}}
                                @endif
                            </p>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            <div class="col-lg-7 col-12 my-auto  mt-lg-0 mt-5 justify-content-center justify-content-lg-end d-flex">
                <div class="thumb">
                   <img src="{{getImage(getFilePath('frontend').'/theme_five_choose_us'.'/'.@$chooseUs->data_values->choose_image)}}" alt="@lang('image')">
                    <div class="video-wrapper">
                        <a class="video-icon" data-rel="lightcase:myCollection"
                            href="{{$chooseUs->data_values->link}}">
                            <i class="fas fa-play"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==================== why choose end ==================== -->
