@extends($activeTemplate.'layouts.frontend')
@section('content')
<!-- ==================== Pricing Start Here ==================== -->
<section class="pricing-plan py-80">
    <div class="container">
        @include($activeTemplate.'components.plan')
    </div>
</section>
<!-- ==================== Pricing End Here ==================== -->
@endsection
