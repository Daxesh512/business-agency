
@php
$subscribe = getContent('subscribe.content',true);
@endphp
<!-- ==================== action Start ==================== -->
<section class="action py-100 bg-overlay-two bg-img" data-background="{{ asset($activeTemplateTrue .'images/action_bg.png') }}">
    <div class="container">
        <div class="row gy-4 justify-content-center">
            <div class="col-lg-6 col-12">
                <div class="title">
                    <h6>{{__(@$subscribe->data_values->top_heading)}}</h6>
                    <h4>{{__(@$subscribe->data_values->heading)}}</h4>
                    <p>{{__(@$subscribe->data_values->sub_heading)}}</p>
                </div>
                <form action="{{route('subscribe')}}" method="POST">
                    @csrf
                    <div class="form">
                        <input type="email" class="form--control mt-3" name="email" required placeholder="@lang('Enter your mail')">
                        <button type="submit"><i class="fas fa-paper-plane"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- ==================== action End ==================== -->
