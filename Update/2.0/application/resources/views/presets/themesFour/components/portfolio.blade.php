<div class="row gy-4 d-flex justify-content-center mt-3 main-content">
    @forelse($portfolios as $index=>$item)
    <div class="col-xl-3 col-lg-4 col-md-6 col-12">
        <div class="card">
            <div class="thumb">
                <img src="{{getImage(getFilePath('portfolioImage').'/'.@$item->image)}}" alt="@lang('image')">
            </div>
            <div class="content">
                <h6>
                    @if(strlen(__($item->title)) >20)
                    {{substr(__($item->title), 0,20).'...' }}
                    @else
                    {{__($item->title)}}
                    @endif
                </h6>
                <p>
                    @if(strlen(__($item->sub_title)) >20)
                    {{substr(__($item->sub_title), 0,20).'...' }}
                    @else
                    {{__($item->sub_title)}}
                    @endif
                </p>
                <div class="d-flex align-items-center">
                    <a href="{{ route('portfolio.details', ['slug' => slug($item->title), 'id' => $item->id])}}">@lang('Explore')<i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    @empty
    <h4 class="text-center">{{__($emptyMessage)}}</h4>
    @endforelse
</div>
