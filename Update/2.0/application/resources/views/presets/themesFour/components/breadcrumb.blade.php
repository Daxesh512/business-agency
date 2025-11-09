<!-- ==================== Breadcumb Start ==================== -->
<section class="breadcumb py-80">
    <div class="container">
        <div class="d-flex justify-content-center mt-5">
            <div class="content">
                <h2>{{__($pageTitle)}}</h2>
                <p>
                    <a href="{{route('home')}}">@lang('Home')</a> /
                    <a href="{{ URL::current() }}" class="text--base">{{__($pageTitle)}}</a>
                </p>
            </div>
        </div>
    </div>
</section>
<!-- ==================== Breadcumb End ==================== -->
