@extends($activeTemplate.'layouts.frontend')
@section('content')
<!-- ==================== Pricing Start Here ==================== -->
<section class="pricing-plan py-80">
    <div class="container">
        @include($activeTemplate.'components.plan')
        <div class="row mt-3">
            <div class="col-12">
                @if ($plans->hasPages())
                <div class="py-4">
                    {{ paginateLinks($plans) }}
                </div>
                @endif
            </div>
        </div>
    </div>
</section>
<!-- ==================== Pricing End Here ==================== -->
@endsection
