@extends($activeTemplate.'layouts.frontend')
@section('content')

<!-- ==================== Blog Start Here ==================== -->
<section class="blog py-80">
    <div class="container">
        @include($activeTemplate.'components.blog')
        <div class="row gy-2">
            <div class="col-sm-12">
                <nav>
                    <ul class="pagination mt-3">
                        @if ($blogs->hasPages())
                        <div class="py-4">
                            {{ paginateLinks($blogs) }}
                        </div>
                        @endif
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- ==================== Blog End Here ==================== -->

@if(@$sections->secs)
@foreach(json_decode($sections->secs) as $sec)
@include($activeTemplate.'sections.'.$sec)
@endforeach
@endif

@endsection
