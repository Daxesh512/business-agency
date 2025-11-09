@extends($activeTemplate.'layouts.frontend')
@section('content')

<section class="py-80 services-details">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-12">
                <div class="content wyg">
                    <h2>{{__($service->title)}}</h2>
                    @php
                    echo $service->description;
                    @endphp
                </div>

                <div class="blog-details__share mt-4 d-flex align-items-center flex-wrap mb-4">
                    <h5 class="social-share__title mb-0 me-sm-3 me-1 d-inline-block">@lang('Share This')</h5>
                    <ul class="social-list blog-details">
                        <li class="social-list__item" data-bs-toggle="tooltip" data-bs-placement="top" title="Facebook"> <a class="social-list__link" target="_blank" href="https://www.facebook.com/share.php?u={{ Request::url() }}&title={{slug(@$service->title)}}"><i class="lab la-facebook-f"></i></a> </li>
                        <li class="social-list__item" data-bs-toggle="tooltip" data-bs-placement="top" title="Linkedin"> <a class="social-list__link" target="_blank" href="https://www.linkedin.com/shareArticle?mini=true&url={{ Request::url() }}&title={{slug(@$service->title)}}&source=behands"><i class="lab la-linkedin-in"></i></a> </li>
                        <li class="social-list__item" data-bs-toggle="tooltip" data-bs-placement="top" title="Twitter"> <a class="social-list__link" target="_blank" href="https://twitter.com/intent/tweet?status={{slug(@$service->title)}}+{{ Request::url() }}"><i class="lab la-twitter"></i></a> </li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-4 col-12">
                <div class="right-side">
                    <div class="price">
                        <h4>@lang('Price')</h4>
                        <h4>{{$general->cur_sym}} {{showAmount($service->price)}}</h4>
                    </div>

                    <div>
                        <a href="{{route('user.service.payment',$service->id)}}" class="btn--base btn--sm w-100 mt-2">@lang('Buy Now')</a>
                    </div>
                </div>

                <div class="right-side mt-5">
                    <h4 class="price">@lang('Latest Services')</h4>
                    @foreach ($latests as $item)
                    <div class="latest-blog">
                        <div class="latest-blog__content">
                            <h5 class="latest-blog__title"><a
                                    href="{{ route('service.details', ['slug' => slug($item->title), 'id' => $item->id])}}">
                                    @if(strlen(__($item->title)) >50)
                                    {{substr( __($item->title), 0,50).'...' }}
                                    @else
                                    {{__($item->title)}}
                                    @endif
                                </a>
                            </h5>
                            <span class="latest-blog__date">{{showDateTime($item->created_at)}}</span>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

@push('style')
<style>
    .wyg h1,
    .wyg h2,
    .wyg h3,
    .wyg h4 {
        color: hsl(var(--black));
    }

    .wyg p {
        color: hsl(var(--black));
    }

    .wyg ul {
        margin: 35px;
    }

    .wyg ul li {
        list-style-type: disc;
        color: hsl(var(--black));
        font-family: var(--body-font);
    }
</style>
@endpush
