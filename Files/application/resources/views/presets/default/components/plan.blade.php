<div class="row gy-4 justify-content-center">
    @foreach ($plans as $item)
    <div class="col-lg-4 col-md-6">
        <div class="pricing-plan-item">
            <img class="price-img-1" src="{{asset($activeTemplateTrue.'images/price-top.png')}}" alt="image-1">
            <img class="price-img-2" src="{{asset($activeTemplateTrue.'images/price-top.png')}}" alt="image-2">
            <div class="pricing-plan-item__top">
                <h3 class="title">{{__($item->name)}}</h3>
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
                   @lang('Get Started') <i class="fas fa-solid fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>
    @endforeach
</div>
