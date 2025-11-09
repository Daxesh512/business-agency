@php
  $faq = getContent('faq.content',true);
  $faqElement = getContent('faq.element',false);
@endphp

<!-- ==================== FAQ Start ==================== -->
<section class="faq py-80">
    <div class="shape">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape6.png') }}" alt="@lang('shape')">
    </div>
    <div class="shape2">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape9.png') }}" alt="@lang('shape')">
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-12 my-auto">
                <div class="title">
                    <h6>{{__($faq->data_values->top_heading)}}</h6>
                    <h4>{{__($faq->data_values->heading)}}</h4>
                    <p>{{__($faq->data_values->sub_heading)}}</p>
                    <a href="{{route('contact')}}" class="btn--base mt-4">@lang('Ask Question')</a>
                </div>
            </div>
            <div class="col-lg-6 col-12 my-auto mt-4 mt-lg-0">
                <div class="accordion custom--accordion" id="accordionExample">
                    @foreach ($faqElement as $item)
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading{{ $loop->index }}">
                          <button class="accordion-button {{ $loop->index == 0 ? '' : 'collapsed' }}" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{{ $loop->index }}" aria-expanded="{{$loop->index == 0 ? 'true': 'false'}}">
                            {{__(@$item->data_values->question)}}
                          </button>
                        </h2>
                        <div id="collapse{{ $loop->index }}" class="accordion-collapse collapse {{$loop->index == 0 ? 'show': ''}}" aria-labelledby="heading{{ $loop->index }}" data-bs-parent="#accordionExample">
                          <div class="accordion-body">
                            @php echo @$item->data_values->answer; @endphp
                          </div>
                        </div>
                      </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==================== FAQ End ==================== -->
