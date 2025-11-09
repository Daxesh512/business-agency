@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="row">
            <div class="d-flex justify-content-end mb-3">
                <a href="{{route('ticket') }}" class="btn--base" target="_blank">@lang('My Support Ticket')</a>
            </div>
            <div class="col-lg-12">
                <div class="dashboard-card-wrap mt-0">
                    <form action="{{route('ticket.store')}}" method="post" enctype="multipart/form-data"
                    onsubmit="return submitUserForm();">
                    @csrf
                        <div class="row gy-4">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="full_name" class="form--label">@lang('Name')</label>
                                    <div class="input--group">
                                        <input type="text" name="name" value="{{@$user->firstname . ' '.@$user->lastname}}"
                                        class="form-control form--control" required readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email_adress" class="form--label">@lang('Email Address')</label>
                                    <div class="input--group">
                                        <input type="email" name="email" value="{{@$user->email}}" class="form--control" required readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="subject" class="form--label">@lang('Subject')</label>
                                    <div class="input--group">
                                        <input type="text" name="subject" value="{{old('subject')}}" class="form--control" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="poriority" class="form--label">@lang('Priority')</label>
                                    <div class="col-sm-12">
                                        <select name="priority" class="form--control form-select select" required>
                                            <option value="3">@lang('High')</option>
                                            <option value="2">@lang('Medium')</option>
                                            <option value="1">@lang('Low')</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="address&quot;" class="form--label">@lang('Message')</label>
                                    <div class="input--group textarea">
                                        <textarea name="message" id="inputMessage" rows="6" class="form--control" required>{{old('message')}}</textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-12 text-end">
                                <button type="button" class="btn--base btn--sm ms-2  addFile">
                                    <i class="fa fa-plus"></i> @lang('Add New')
                                </button>
                            </div>
                            <div class="col-lg-12">
                                <div class="attachment_wrapper mb-4">
                                    <div class="form-group profile mb-15">
                                        <label for="attachments" class="form--label">@lang('Attachments')</label>
                                        <div class="single-input form-group">
                                            <input type="file" name="attachments[]" id="inputAttachments"
                                            class="form--control mb-2">
                                            <div id="fileUploadsContainer"></div>
                                        </div>
                                        <p> @lang('Allowed File Extensions'): .@lang('jpg'), .@lang('jpeg'), .@lang('png'),
                                            .@lang('pdf'), .@lang('doc'), .@lang('docx')</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 text-end">
                                <button type="submit" class="btn--base ms-2" id="recaptcha">
                                    @lang('Submit')
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('style')
<style>
    .input-group-text:focus {
        box-shadow: none !important;
    }
</style>
@endpush

@push('script')
<script>
    (function ($) {
        "use strict";
        var fileAdded = 0;
        $('.addFile').on('click', function () {
            if (fileAdded >= 4) {
                notify('error', 'You\'ve added maximum number of file');
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
        $(document).on('click', '.remove-btn', function () {
            fileAdded--;
            $(this).closest('.input-group').remove();
        });
    })(jQuery);
</script>
@endpush
