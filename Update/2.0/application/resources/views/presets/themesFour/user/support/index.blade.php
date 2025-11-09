@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="m-0">
            <div class="list-card">
                <div class="d-flex justify-content-end mb-3">
                    <a href="{{route('ticket.open') }}" class="btn--base"> <i class="fa fa-plus"></i> @lang('New Ticket')</a>
                </div>
                <div class="table-area m-0">
                    <table class="custom-table">
                        <thead>
                            <tr>
                                <th>@lang('Subject')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Priority')</th>
                                <th>@lang('Last Reply')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($supports as $support)
                                <tr>
                                    <td data-label="@lang('Subject')"> <a href="{{ route('ticket.view', $support->ticket) }}" class="text--base"> [@lang('Ticket')#{{ $support->ticket }}] {{ __($support->subject) }}  </a></td>
                                    <td data-label="@lang('Status')">
                                        @php echo $support->statusBadge; @endphp
                                    </td>
                                    <td data-label="@lang('Priority')">
                                        @if($support->priority == 1)
                                            <span class="badge badge--dark">@lang('Low')</span>
                                        @elseif($support->priority == 2)
                                            <span class="badge badge--success">@lang('Medium')</span>
                                        @elseif($support->priority == 3)
                                            <span class="badge badge--primary">@lang('High')</span>
                                        @endif
                                    </td>
                                    <td data-label="@lang('Last Reply')">{{ \Carbon\Carbon::parse($support->last_reply)->diffForHumans() }} </td>


                                    <td data-label="@lang('Action')" class="table-dropdown">
                                        <i class="fas fa-ellipsis-v" data-bs-toggle="dropdown"></i>

                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="{{ route('ticket.view', $support->ticket) }}" target="_blank">
                                                @lang('View')
                                            </a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td data-label="Support Ticket Table" colspan="100%" class="text-center" data-label="@lang('Support Ticket Table')">{{__($emptyMessage) }}</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                <div class="mt-5">
                    {{$supports->links()}}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
