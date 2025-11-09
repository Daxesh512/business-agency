@extends('admin.layouts.app')
@section('panel')

<div class="row">
    <div class="col-lg-12">
        <div class="card b-radius--10 ">
            <div class="card-body p-0">
                <div class="table-responsive--sm table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                            <tr>
                                <th>@lang('SL')</th>
                                <th>@lang('User')</th>
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
                                <td  data-label="@lang('User')">
                                   {{__(@$subscription->user->username)}}
                                </td>
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
                    </table><!-- table end -->
                </div>
            </div>
            @if ($subscriptions->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($subscriptions) }}
            </div>
            @endif
        </div><!-- card end -->
    </div>
</div>
@endsection
