<div class="row gy-4 d-flex justify-content-center main-content">
    @forelse($services as $item)
    <div class="col-lg-4 col-md-6">
        <div class="service">
            <div class="service__icon">
                @php echo $item->icon; @endphp
            </div>
            <div class="service__content mb-3">
                <h3 class="title">
                    @if(strlen(__($item->title)) >50)
                    {{substr( __($item->title), 0,50).'...' }}
                    @else
                    {{__($item->title)}}
                    @endif
                </h3>
                <p>
                    @if(strlen(strip_tags($item->description)) >140)
                    {{substr(strip_tags($item->description), 0,140).'...' }}
                    @else
                    {{strip_tags($item->description)}}
                    @endif
                </p>
            </div>
            <div class="service-bottom-wrap d-flex justify-content-between align-items-center">
                <p class="price-service">{{$general->cur_sym}} {{showAmount($item->price)}}</p>
                <a href="{{ route('service.details', ['slug' => slug($item->title), 'id' => $item->id])}}" class="btn btn--base"> @lang('Buy now') <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
    </div>
    @empty
    <h2 class="text-center">{{__($emptyMessage)}}</h2>
    @endforelse
</div>
