@extends($activeTemplate.'layouts.frontend')
@section('content')

<!-- ==================== Pricing Start Here  ==================== -->
<section class="pricing-plan py-80">
    <div class="container">
        @include($activeTemplate.'components.plan')
        <div class="row">
            <div class="col-sm-12">
                <nav>
                    <ul class="pagination mt-3">
                        @if ($plans->hasPages())
                        <div class="py-4">
                            {{ paginateLinks($plans) }}
                        </div>
                        @endif
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- ==================== Pricing End Here ==================== -->

@endsection

