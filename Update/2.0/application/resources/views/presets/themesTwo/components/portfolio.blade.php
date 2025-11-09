<div class="row gy-4 align-items-center justify-content-center main-content">
    @forelse($portfolios as $item)
    <div class="col-lg-4 col-md-4">
        <div class="Our-Project">
            <a href="{{ route('portfolio.details', ['slug' => slug($item->title), 'id' => $item->id])}}">
                <img class="img-1" src="{{getImage(getFilePath('portfolioImage').'/'.$item->image)}}" alt="image">
                <div class="content">
                    <h4>  @if(strlen(__($item->title)) >20)
                        {{substr(__($item->title), 0,20).'...' }}
                        @else
                        {{__($item->title)}}
                        @endif</h4>
                    <span>
                        @if(strlen(__($item->sub_title)) >20)
                        {{substr(__($item->sub_title), 0,20).'...' }}
                        @else
                        {{__($item->sub_title)}}
                        @endif
                    </span>
                </div>
            </a>
        </div>
    </div>
    @empty
    <h2 class="text-center">{{__($emptyMessage)}}</h2>
    @endforelse
</div>
