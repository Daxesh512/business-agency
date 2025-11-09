
<div class="row gy-4 mt-3 main-content">
    @forelse($portfolios as $index=>$item)
    <div class="col-xl-4 col-lg-4 col-md-6 col-12">
        <div class="card">
            <a href="{{ route('portfolio.details', ['slug' => slug($item->title), 'id' => $item->id])}}">
                <img src="{{getImage(getFilePath('portfolioImage').'/'.@$item->image)}}" class="img-1" alt="@lang('image')">
                <div class="content">
                    <h5>
                        @if(strlen(__($item->title)) >20)
                        {{substr(__($item->title), 0,20).'...' }}
                        @else
                        {{__($item->title)}}
                        @endif
                    </h5>
                    <p>
                        @if(strlen(__($item->sub_title)) >20)
                        {{substr(__($item->sub_title), 0,20).'...' }}
                        @else
                        {{__($item->sub_title)}}
                        @endif
                    </p>
                </div>
            </a>
        </div>
    </div>
    @empty
    <h4 class="text-center">{{__($emptyMessage)}}</h4>
    @endforelse
</div>
