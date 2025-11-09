@extends($activeTemplate.'layouts.master')
@section('content')

<!-- ==================== Card Start Here ==================== -->
<div class="col-xl-9 col-lg-12">
    <div class="dashboard-body">
        <div class="row gy-4 justify-content-center">
            <div class="contactus-form">
                <div class="row justify-content-end mb-3">
                    <div class="col-xl-4 col-lg-5 col-md-6 col-10"> <input type="text" class="form--control" name="search_table" placeholder="@lang('Search')...">
                    </div>
                </div>
                <h4>{{__($pageTitle)}}</h4>
                <div class="card-wrap pb-30">
                    <table class="table table--responsive--lg custom-table">
                        <thead>
                            <tr>
                                <th>@lang('SL')</th>
                                <th>@lang('Plan Name')</th>
                                <th>@lang('Time')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Expired Date')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($subscriptions as $key=>$subscription)
                            <tr>
                                <td data-label="@lang('SL')">{{ $key+1}}</td>
                                <td data-label="@lang('Plan Name')"><a href="{{route('plans')}}">{{__(@$subscription->plan->name)}}</a></td>
                                <td data-label="@lang('Time')">{{showDateTime($subscription->created_at)}}</td>
                                <td data-label="@lang('Status')">
                                    @if($subscription->ends_at >= now())
                                    <span class="badge badge--success">@lang('Active')</span>
                                    @else
                                    <span class="badge badge--danger">@lang('Expired')</span>
                                    @endif
                                </td>
                                <td data-label="@lang('Expired Date')">{{ \Carbon\Carbon::parse($subscription->ends_at)->format('d M Y H:i') }}</td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%" data-label="Order Table">{{ __($emptyMessage) }}</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
            </div>
            <div class="mt-5">
                @if ($subscriptions->hasPages())
                <div class="py-4">
                    {{ paginateLinks($subscriptions) }}
                </div>
                @endif
            </div>
        </div>
    </div>
</section>
<!-- ==================== Card End Here ==================== -->
@endsection

@push('script')
<script>
    (function ($) {
            "use strict";

            $('.custom-table').css('padding-top', '0px');
            var tr_elements = $('.custom-table tbody tr');

            $(document).on('input', 'input[name=search_table]', function () {
                "use strict";

                var search = $(this).val().toUpperCase();
                var match = tr_elements.filter(function (idx, elem) {
                    return $(elem).text().trim().toUpperCase().indexOf(search) >= 0 ? elem : null;
                }).sort();
                var table_content = $('.custom-table tbody');
                if (match.length == 0) {
                    table_content.html('<tr><td colspan="100%" class="text-center">Data Not Found</td></tr>');
                } else {
                    table_content.html(match);
                }
            });

            $('.deletModalBtn').on('click', function () {
                var modal = $('#deleteModal');
                var id = $(this).data('id');
                modal.find('input[name=id]').val(id);
                modal.modal('show');
            });

    })(jQuery);

</script>
@endpush

