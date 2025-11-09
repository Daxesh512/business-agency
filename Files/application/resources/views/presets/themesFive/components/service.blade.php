
<div class="row gy-5 mt-2 main-content">
    @forelse ($services as $item)
    <div class="col-xl-4 col-lg-4 col-md-6 col-12">
        <div class="card">
            <div class="icon">
                @php echo $item->icon; @endphp
            </div>
            <div class="content">
                <h5>
                    @if(strlen(__($item->title)) >50)
                    {{substr(__($item->title), 0,50).'...' }}
                    @else
                    {{__($item->title)}}
                    @endif
                </h4>
                <p>
                    @if(strlen(strip_tags(__($item->description))) > 160)
                    {{ substr(strip_tags(__($item->description)), 0, 160) . '...' }}
                    @else
                    {{ strip_tags(__($item->description)) }}
                    @endif
                </p>
            </div>
            <div>
                <a href="{{ route('service.details', ['slug' => slug($item->title), 'id' => $item->id])}}" class="btn--base">@lang('Buy Now') {{$general->cur_sym}}{{showAmount($item->price)}}
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>
    @empty
    <h4 class="text-center">{{__($emptyMessage)}}</h4>
    @endforelse
</div>
