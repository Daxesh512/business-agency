<div class="row gy-4 justify-content-center position-relative">
    <div class="square-shape-1 animate-y-axis">
        <div class="item">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="item">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="item">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="item">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="item">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="item">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="item">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
    @foreach ($plans as $item)
    <div class="col-lg-4 col-md-6">
        <div class="pricing-plan-item">
            <div class="price-shape-1"></div>
            <div class="price-shape-2"></div>
            <div class="pricing-plan-item__top mb-2">
                <h3 class="title mb-4">{{__($item->name)}}</h3>
            </div>
            <div class="pricing-plan-item__price">
                <h3 class="title">{{$general->cur_sym}} {{showAmount($item->price)}}<span>{{$item->type==1 ? '/m' : '/y'}}</span> </h3>
            </div>
            <div class="pricing-plan-item__list">
                <ul>
                    @if(@$item->content)
                        @foreach(json_decode(@$item->content) as $value)
                    <li> <i class="fas fa-check-circle"></i>{{__($value)}}</li>
                    @endforeach
                    @endif
                </ul>
            </div>
            <div class="pricing-plan-item__bottom">
                <a class="btn btn--base" href="{{route('user.payment',$item->id)}}">
                    @lang('Get Started') <i class="fa-sharp fas fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>
    @endforeach

</div>
