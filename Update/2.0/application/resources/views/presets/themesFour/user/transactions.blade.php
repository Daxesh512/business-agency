@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="m-0">
            <div class="list-card">
                <div class="row search-dash justify-content-end mb-3">
                    <div class="col-12">
                        <form action="">
                            <div class="d-flex flex-wrap gap-4">
                                <div class="flex-grow-1">
                                    <label class="form--label">@lang('Transaction Number')</label>
                                    <input type="text" name="search" value="{{ request()->search }}" class="form--control">
                                </div>
                                <div class="flex-grow-1">
                                    <label class="form--label">@lang('Type')</label>
                                    <select name="type" class="form--control form-select">
                                        <option value="">@lang('All')</option>
                                        <option value="+" @selected(request()->type == '+')>@lang('Plus')</option>
                                        <option value="-" @selected(request()->type == '-')>@lang('Minus')</option>
                                    </select>
                                </div>
                                <div class="flex-grow-1">
                                    <label class="form--label">@lang('Remark')</label>
                                    <select class="form--control form-select" name="remark">
                                        <option value="">@lang('Any')</option>
                                        @foreach($remarks as $remark)
                                        <option value="{{ $remark->remark }}" @selected(request()->remark ==
                                            $remark->remark)>{{ __(keyToTitle($remark->remark)) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="flex-grow-1 align-self-end">
                                    <button class="btn--base w-100">@lang('Filter')</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-12">
                        <table class="custom-table">
                            <thead>
                                <tr>
                                    <th>@lang('Trx')</th>
                                    <th>@lang('Transacted')</th>
                                    <th>@lang('Amount')</th>
                                    <th>@lang('Post Balance')</th>
                                    <th>@lang('Detail')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($transactions as $trx)
                                <tr>
                                    <td data-label="@lang('Trx')">
                                       {{ $trx->trx }}
                                    </td>

                                    <td data-label="@lang('Transacted')">
                                        {{ showDateTime($trx->created_at) }}
                                    </td>

                                    <td data-label="@lang('Amount')">
                                        <span
                                            class="@if($trx->trx_type == '+')text-success @else text-danger @endif">
                                            {{ $trx->trx_type }} {{showAmount($trx->amount)}} {{ $general->cur_text }}
                                        </span>
                                    </td>

                                    <td data-label="@lang('Post Balance')">
                                        {{ showAmount($trx->post_balance) }} {{__($general->cur_text) }}
                                    </td>


                                    <td data-label="@lang('Detail')">{{__($trx->details) }}</td>
                                </tr>
                                @empty
                                <tr>
                                    <td class="text-muted text-center" colspan="100%" data-label="@lang('Transaction Table')">{{__($emptyMessage) }}</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    <div class="mt-5">
                        @if($transactions->hasPages())
                        <div class="text-end">
                            {{ $transactions->links() }}
                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
