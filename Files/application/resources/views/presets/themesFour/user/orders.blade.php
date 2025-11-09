@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="m-0">
            <div class="list-card">
                <div class="row search-dash justify-content-end mb-3">
                    <div class="col-xl-3 col-lg-5 col-md-6 col-10"> <input type="text" class="form--control" name="search_table" placeholder="@lang('Search')...">
                        <i class="las la-search"></i>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-12">
                        <table class="custom-table">
                            <thead>
                                <tr>
                                    <th>@lang('Order Date')</th>
                                    <th>@lang('Order Number')</th>
                                    <th>@lang('Service Name')</th>
                                    <th>@lang('File')</th>
                                    <th>@lang('Amount')</th>
                                    <th>@lang('Status')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($orders as $order)
                                <tr>
                                    <td data-label="@lang('Order Date')">{{ showDateTime($order->created_at)}}</td>
                                    <td data-label="@lang('Order Number')" class="fw-bold">#{{$order->order_number}}</td>

                                    @if(isset($order->service))
                                        <td data-label="@lang('Service Name')"><a href="{{ route('service.details', ['slug' => slug(@$order->service->title), 'id' => @$order->service->id])}}">{{__(@$order->service->title)}}</a></td>
                                        @if($order->status == 1 && isset($order->service->file) )
                                            <td data-label="@lang('File')"> <a class="btn--base btn--sm" href="{{ route('user.service.file.download',@$order->service->id) }}" title="File Download"><i class="fas fa-download"></i> @lang('File')</a></td>
                                        @else
                                            <td data-label="@lang('File')">@lang('File not available')</td>
                                        @endif
                                    @else
                                        <td data-label="@lang('Service Name')">@lang('Service Unavailable')</td>
                                        <td data-label="@lang('File')">@lang('Service Unavailable')</td>
                                    @endif

                                    <td data-label="@lang('Amount')">{{$general->cur_sym}} {{showAmount($order->service_price)}} </td>
                                    <td data-label="@lang('Status')">@php echo $order->statusBadge($order->status) @endphp </td>
                                </tr>
                                @empty
                                <tr>
                                    <td class="text-muted text-center" colspan="100%" data-label="@lang('Order Table')">{{__($emptyMessage) }}</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    <div class="mt-5">
                        @if ($orders->hasPages())
                        <div class="py-4">
                            {{ paginateLinks($orders) }}
                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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

