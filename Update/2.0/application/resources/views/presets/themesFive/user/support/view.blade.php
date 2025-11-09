@extends($activeTemplate.'layouts.'.$layout)
@section('content')
<div class="{{ auth()->check() ? 'body-wrapper' : 'container py-80' }}">
    <div class="table-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="dashboard-card-wrap mt-0">
                    <div class="row gy-4">
                        <div class="col-md-12">
                            <div class="d-flex flex-wrap justify-content-between align-items-center">
                                <h5 class="mt-0">
                                    @php echo $myTicket->statusBadge; @endphp
                                    [@lang('Ticket')#{{ $myTicket->ticket }}] {{ $myTicket->subject }}
                                </h5>
                                @if($myTicket->status != 3 && $myTicket->user)
                                <button class="btn--base  btn--danger  btn--sm confirmationBtn" type="button" data-question="@lang('Are you sure to close this ticket?')" data-action="{{ route('ticket.close', $myTicket->id) }}"><i class="fa fa-lg fa-times-circle"></i>
                                </button>
                                @endif
                            </div>
                        </div>
                        @if($myTicket->status != 4)
                        <form method="post" action="{{ route('ticket.reply', $myTicket->id) }}" enctype="multipart/form-data">
                            @csrf
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="message" class="form--label">@lang('Message')</label>
                                    <div class="input--group textarea">
                                        <textarea name="message" class="form-control form--control" rows="4">{{ old('message') }}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 text-end">
                                <button type="button" class="btn--base btn--sm ms-2 mt-2 addFile">
                                    <i class="fa fa-plus"></i> @lang('Add New')
                                </button>
                            </div>
                            <div class="col-lg-12">
                                <div class="attachment_wrapper mb-4">
                                    <div class="form-group profile mb-15">
                                        <label for="attachments" class="form--label">@lang('Attachments')</label>
                                        <div class="single-input form-group">
                                            <input type="file" name="attachments[]" class="form-control form--control">
                                            <div id="fileUploadsContainer"></div>
                                        </div>
                                        <p> @lang('Allowed File Extensions'): .@lang('jpg'), .@lang('jpeg'), .@lang('png'), .@lang('pdf'), .@lang('doc'), .@lang('docx')</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 text-end">
                                <button type="submit" class="btn--base ms-2">
                                    <i class="fa fa-reply"></i> @lang('Reply')
                                </button>
                            </div>
                        </form>
                        @endif
                        <div class="col-lg-12">
                            <div class="support_reply_bottom">
                                @foreach($messages as $message)
                                @if($message->admin_id == 0)
                                <div class="support_reply__single mb-3">
                                    <div class="row">
                                        <h5>{{ $message->ticket->name }}</h5>
                                        <div class="col-md-6">
                                            <p class="mb-2"> {{$message->message}} </p>
                                            @if($message->attachments->count() > 0)
                                                <div class="mt-2">
                                                    @foreach($message->attachments as $k=> $image)
                                                        <a href="{{route('ticket.download',encrypt($image->id))}}" class="me-3"><i class="fa fa-file"></i>  @lang('Attachment') {{++$k}} </a>
                                                    @endforeach
                                                </div>
                                            @endif
                                            <h6>{{ $message->created_at->format('l, dS F Y @ H:i') }}</h6>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                @else
                                <div class="support_reply__single">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h5>{{ $message->admin->name }}</h5>
                                            <p class="mb-2">{{$message->message}}</p>
                                            @if($message->attachments->count() > 0)
                                                <div class="mt-2">
                                                    @foreach($message->attachments as $k=> $image)
                                                        <a href="{{route('ticket.download',encrypt($image->id))}}" class="me-3"><i class="fa fa-file"></i>  @lang('Attachment') {{++$k}} </a>
                                                    @endforeach
                                                </div>
                                            @endif
                                            <h6>{{ $message->created_at->format('l, dS F Y @ H:i') }}</h6>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                @endif
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<x-confirmation-modal></x-confirmation-modal>
@endsection
@push('style')
    <style>
        .input-group-text:focus{
            box-shadow: none !important;
        }
    </style>
@endpush
@push('script')
    <script>
        (function ($) {
            "use strict";

            var fileAdded = 0;
            $('.addFile').on('click',function(){
                if (fileAdded >= 4) {
                    notify('error','You\'ve added maximum number of file');
                    return false;
                }
                fileAdded++;
                $("#fileUploadsContainer").append(`
                    <div class="input-group my-3">
                        <input type="file" name="attachments[]" class="form-control form--control" required />
                        <button class="input-group-text btn-danger remove-btn"><i class="las la-times"></i></button>
                    </div>
                `)
            });

            $(document).on('click','.remove-btn',function(){
                fileAdded--;
                $(this).closest('.input-group').remove();
            });

        })(jQuery);

    </script>
@endpush
