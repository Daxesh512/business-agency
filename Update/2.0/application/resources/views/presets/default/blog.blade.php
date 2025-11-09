@extends($activeTemplate.'layouts.frontend')
@section('content')
<!-- ==================== Blog Start Here ==================== -->
<section class="blog py-80">
    <div class="container">
        @include($activeTemplate.'components.blog')
        <div class="row mt-3">
            <div class="col-12">
                @if($blogs->hasPages())
                <div class="py-4">
                    {{ paginateLinks($blogs) }}
                </div>
                @endif
            </div>
        </div>
    </div>
</section>
<!-- ==================== Blog End Here ==================== -->

@endsection
