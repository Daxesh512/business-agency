<div class="row gy-4 d-flex justify-content-center mt-3">
    @foreach ($plans as $key=>$item)
    <div class="col-lg-4 col-md-6 col-12">
        <div class="card {{ $key == 1 ? 'active' : '' }}">
            <div class="content">
                <h5>{{__($item->name)}}</h5>
                <p>@lang('Get Started With The') {{__($item->name)}} @lang('Subscription Plan Starting Partner')
                </p>
                <h4>{{__($general->cur_sym)}} {{showAmount($item->price)}}<span>{{$item->type == 1 ? '/m' :'/y'}}</span></h4>
                <a href="{{route('user.payment',$item->id)}}" class="btn--base w-100">@lang('Buy Now')</a>
            </div>
            <div class="details">
                <h6>@lang('Whats included')</h6>
                @if(@$item->content)
                @foreach(json_decode(@$item->content) as $value)
                <div class="d-flex mb-2">
                    <i class="fas fa-check-circle"></i>
                    <p>{{__($value)}}</p>
                </div>
                @endforeach
                @endif
            </div>
        </div>
    </div>
    @endforeach
</div>
