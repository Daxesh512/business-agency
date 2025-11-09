<div class="row gy-4 mt-3">
    @forelse ($plans as $key=>$item)
    <div class="col-lg-4 col-md-6 col-12">
        <div class="card">
            <div class="content">
                <h2 class="price">{{$general->cur_sym}} {{showAmount($item->price)}}<span>{{$item->type == 1 ? '/m' :'/y'}}</span></h2>
                <p>{{__($item->name)}}</p>
                <a href="{{route('user.payment',$item->id)}}" class="btn--base">@lang('Get Started')</a>
            </div>
            <div class="details">
                <div>
                    @if(@$item->content)
                    @foreach(json_decode(@$item->content) as $value)
                        <p>{{__($value)}}</p>
                    @endforeach
                    @endif
                </div>
            </div>
        </div>
    </div>
    @empty
    <h2 class="text-center">{{__($emptyMessage)}}</h2>
    @endforelse
</div>
