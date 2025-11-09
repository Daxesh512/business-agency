@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="row gy-4 mb-4">

            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="javascript:void(0)" class="d-flex justify-content-between">
                        <div>
                            <div>
                                <p>@lang('Balance')</p>
                            </div>
                            <div class="content">
                                <span class="text-uppercase">{{$general->cur_sym}} {{showAmount($user->balance)}}</span>
                            </div>

                        </div>
                        <div class="icon my-auto">
                            <i class="fas fa-money-check-alt"></i>
                        </div>
                    </a>
                </div>
            </div>

            @if($subscribe)
            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="{{route('plans')}}" class="d-flex justify-content-between">
                        <div>
                            <div>
                                <p>{{__(@$subscribe->plan->name)}} <span class="text-success">(@lang('Subscribed'))</span></p>
                            </div>
                            <div class="content">
                                <span class="text-uppercase">{{$general->cur_sym}} {{showAmount(@$subscribe->plan->price)}}</span>
                            </div>

                        </div>
                        <div class="icon my-auto">
                            <i class="las la-gift"></i>
                        </div>
                    </a>
                </div>
            </div>
            @elseif($subscribe === false)
            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="{{route('plans')}}" class="d-flex justify-content-between">
                        <div>
                            <div>
                                <p>@lang('Current Plan Expired')</p>
                            </div>
                            <div class="content">
                                <p class="text-uppercase">@lang('subscribe to a new plan')</p>
                            </div>

                        </div>
                        <div class="icon my-auto">
                            <i class="las la-gift"></i>
                        </div>
                    </a>
                </div>
            </div>
            @elseif($subscribe === null)
            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="{{route('plans')}}" class="d-flex justify-content-between">
                        <div>
                            <div>
                                <p>@lang('No Plan')</p>
                            </div>
                            <div class="content">
                                <p class="text-uppercase">@lang('subscribe to a new plan')</p>
                            </div>

                        </div>
                        <div class="icon my-auto">
                            <i class="las la-gift"></i>
                        </div>
                    </a>
                </div>
            </div>
            @endif

            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="{{route('services')}}" class="d-flex justify-content-between">
                        <div>
                            <div>
                                <p>@lang('Services')</p>
                            </div>
                            <div class="content">
                                <p class="text-uppercase">@lang('all services')</p>
                            </div>

                        </div>
                        <div class="icon my-auto">
                            <i class="fab fa-servicestack"></i>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="" class="d-flex justify-content-between">
                        <div>
                            <div>
                                <p>@lang('All Orders')</p>
                            </div>
                            <div class="content">
                                <span class="text-uppercase">{{$totalOrders}}</span>
                            </div>
                        </div>
                        <div class="icon my-auto">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                    </a>
                </div>
            </div>

        </div>

        <div class="row mb-4">
            <div class="col-12">
                <div class="chart">
                    <div class="chart-bg">
                        <h4>@lang('Monthly Deposit History')</h4>
                        <div id="account-chart"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="m-0">
            <div class="list-card">
                <div class="header-title-list">
                    <h4 class="pb-0">@lang('Recent Services Order')</h4>
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
                                        <td data-label="@lang('Service Name')">{{__(@$order->service->title)}}</td>
                                        @if($order->status == 1 && isset($order->service->file) )
                                            <td data-label="@lang('File')"> <a class="btn btn--base btn--sm" href="{{ route('user.service.file.download',@$order->service->id) }}" title="File Download"><i class="fas fa-download"></i> @lang('File')</a></td>
                                        @else
                                            <td data-label="@lang('File')">@lang('File not available')</td>
                                        @endif
                                    @else
                                        <td data-label="@lang('Service Name')">@lang('Service Unavailable')</td>
                                        <td data-label="@lang('File')">@lang('Service Unavailable')</td>
                                    @endif

                                    <td data-label="@lang('Amount')">{{__($general->cur_sym)}} {{showAmount($order->service_price)}} </td>
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
                </div>
            </div>
        </div>

    </div>
</div>
@endsection

@push('script')
<script src="{{asset('assets/admin/js/apexcharts.min.js')}}"></script>
<script>
    (function () {
        "use strict";

        var options = {
            chart: {
                type: 'area',
                stacked: false,
                height: '310px'
            },
            stroke: {
                width: [0, 3],
                curve: 'smooth'
            },
            plotOptions: {
                bar: {
                    columnWidth: '50%'
                }
            },
            colors: ['#00adad', '#67BAA7'],
            series: [{
        name: '@lang("Deposits")',
        type: 'area',
        data: @json($depositsChart['values'])
    }],
    fill: {
        opacity: [0.85, 1],
                },
    labels: @json($depositsChart['labels']),
    markers: {
        size: 0
    },
    xaxis: {
        type: 'text'
    },
    yaxis: {
        min: 0
    },
    tooltip: {
        shared: true,
            intersect: false,
                y: {
            formatter: function (y) {
                if (typeof y !== "undefined") {
                    return "$ " + y.toFixed(0);
                }
                return y;

            }
        }
    },
    legend: {
        labels: {
            useSeriesColors: true
        },
        markers: {
            customHTML: [
                function () {
                    return ''
                },
                function () {
                    return ''
                }
            ]
        }
    }
            }
    var chart = new ApexCharts(
        document.querySelector("#account-chart"),
        options
    );
    chart.render();
    }) ();
</script>
@endpush


