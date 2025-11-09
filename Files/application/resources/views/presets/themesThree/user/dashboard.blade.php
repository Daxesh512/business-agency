@extends($activeTemplate.'layouts.master')
@section('content')
@php
if($subscribe){
    $start = Carbon\Carbon::parse($subscribe->starts_at);
    $end = Carbon\Carbon::parse($subscribe->ends_at);
    $durationInDays = $end->diffInDays($start);
    $duration = $end->diffForHumans($start);
}
@endphp
<!-- ==================== Dashboard Start Here ==================== -->
<div class="col-xl-9 col-lg-8">
    <div class="dashboard-body contactus-form">
        <div class="row gy-4 mb-5 justify-content-center">
            @if($subscribe)
            <div class="col-xl-4 col-lg-6 col-sm-6">
              <a class="d-block" href="{{route('plans')}}">
                <div class="dashboard-card">
                    <div class="dashboard-card__icon">
                        <i class="las la-gift"></i>
                    </div>
                    <div class="dashboard-card__content">
                        <h5 class="dashboard-card__title">{{__($subscribe->plan->name)}} <span class="text-success">(@lang('Subscribed'))</span></h5>
                        <h4 class="dashboard-card__amount">{{__($general->cur_sym)}} {{showAmount($subscribe->plan->price)}}</h4>
                        <h4 class="dashboard-card__amount mt-1">@lang('Expired'): <span id="expired-in"></span></h4>
                    </div>
                </div>
              </a>
            </div>
            @elseif($subscribe === false)
            <div class="col-xl-4 col-lg-6 col-sm-6">
                <a class="d-block" href="{{route('plans')}}">
                    <div class="dashboard-card">
                        <div class="dashboard-card__icon">
                            <i class="las la-gift"></i>
                        </div>
                        <div class="dashboard-card__content">
                            <h5 class="dashboard-card__title text-danger">@lang('Current Plan Expired')</h5>
                            <h4 class="dashboard-card__amount text-white">@lang('subscribe to a new plan')</h4>
                        </div>
                    </div>
                </a>
            </div>
            @elseif($subscribe === null)
            <div class="col-xl-4 col-lg-6 col-sm-6">
                <a class="d-block" href="{{route('plans')}}">
                    <div class="dashboard-card">
                        <div class="dashboard-card__icon">
                            <i class="las la-gift"></i>
                        </div>
                        <div class="dashboard-card__content">
                            <h5 class="dashboard-card__title text-danger">@lang('No Plan')</h5>
                            <h4 class="dashboard-card__amount">@lang('subscribe to a new plan')</h4>
                        </div>
                    </div>
                </a>
            </div>
            @endif

            <div class="col-xl-4 col-lg-6 col-sm-6">
               <a class="d-block" href="{{route('plans')}}">
                <div class="dashboard-card">
                    <div class="dashboard-card__icon">
                        <i class="las la-gift"></i>
                    </div>
                    <div class="dashboard-card__content">
                        <h5 class="dashboard-card__title">@lang('Plans')</h5>
                        <h4 class="dashboard-card__amount">@lang('all plans')</h4>
                    </div>
                </div>
               </a>
            </div>
            <div class="col-xl-4 col-lg-6 col-sm-6">
                <a class="d-block" href="{{route('services')}}">
                    <div class="dashboard-card">
                        <div class="dashboard-card__icon">
                            <i class="fab fa-servicestack"></i>
                        </div>
                        <div class="dashboard-card__content">
                            <h5 class="dashboard-card__title">@lang('Services')</h5>
                            <h4 class="dashboard-card__amount">@lang('all services')</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-xl-6 col-lg-6 col-sm-6">
                <a class="d-block" href="{{route('user.orders')}}">
                    <div class="dashboard-card ">
                        <div class="dashboard-card__icon">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="dashboard-card__content">
                            <h5 class="dashboard-card__title">@lang('All Orders')</h5>
                            <h4 class="dashboard-card__amount">{{__( $totalOrders)}}</h4>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-6 col-lg-6 col-sm-6">
                <a class="d-block" href="javascript:void(0)">
                    <div class="dashboard-card ">
                        <div class="dashboard-card__icon">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <div class="dashboard-card__content">
                            <h5 class="dashboard-card__title">@lang('Balance')</h5>
                            <h4 class="dashboard-card__amount">{{__($general->cur_sym)}} {{showAmount(auth()->user()->balance)}}</h4>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col-lg-12">
                <div class="chart">
                    <div class="chart-bg">
                        <h4>@lang('Monthly Deposit History')</h4>
                        <div id="account-chart"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ==================== Dashboard End Here ==================== -->

@endsection

@push('script')
<script src="{{asset('assets/admin/js/apexcharts.min.js')}}"></script>
<script>
    $(document).ready(function() {
        "use strict";
        var end = moment('{{ @$subscribe->ends_at }}');
        var now = moment();

        function updateExpiredIn() {
            var duration = moment.duration(end.diff(now));
            var days = Math.floor(duration.asDays());
            var hours = Math.floor(duration.asHours()) - days * 24;
            var minutes = Math.floor(duration.asMinutes()) - days * 24 * 60 - hours * 60;
            var seconds = Math.floor(duration.asSeconds()) - days * 24 * 60 * 60 - hours * 60 * 60 - minutes * 60;

            var expiredIn = days + ' days ' + hours + ' hours ' + minutes + ' minutes ' + seconds + ' seconds';
            $('#expired-in').text(expiredIn);
        }

        // update the expired time every second
        setInterval(function() {
            now = moment();
            updateExpiredIn();
        }, 1000);

        // initial update
        updateExpiredIn();
    });

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

