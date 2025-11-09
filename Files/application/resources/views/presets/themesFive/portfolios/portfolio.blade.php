@extends($activeTemplate.'layouts.frontend')
@section('content')
<section class="portfolio py-80">
    <div class="container">

        <div class="row justify-content-end">
            <div class="col-xl-3 col-lg-5 col-md-6 col-12">
                <input type="text" name="search" id="searchValue" placeholder="@lang('Search by title')..." class="form--control">
            </div>
        </div>

        @include($activeTemplate.'components.portfolio')
        <div class="row mt-3">
            <div class="col-12">
                @if ($portfolios->hasPages())
                <div class="py-4">
                    {{ paginateLinks($portfolios) }}
                </div>
                @endif
            </div>
        </div>
    </div>
</section>
@endsection

@push('script')
<script>
    (function ($) {
        "use strict";

        $("#searchValue").on('keyup', function () {
            var searchValue = $(this).val();
            getFilteredData(searchValue)

        });


        function getFilteredData(searchValue){

            $.ajax({
                type: "get",
                url: "{{ route('portfolio.filtered') }}",
                data:{
                    "searchValue": searchValue,
                },
                dataType: "json",
                success: function (response) {
                    if(response.html){
                        $('.main-content').html(response.html);
                    }

                    if(response.error){
                        notify('error', response.error);
                    }
                }
            });
        }

    })(jQuery);
</script>
@endpush

