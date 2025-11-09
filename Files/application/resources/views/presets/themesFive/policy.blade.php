@extends($activeTemplate.'layouts.frontend')
@section('content')
<!--=======-** Privacy Policy start **-=======-->
<section class="py-80 policy">
    <div class="thumb2">
        <img src="{{ asset($activeTemplateTrue .'images/shape/shape6.png') }}" alt="@lang('shape')">
    </div>
    <div class="container">
        <div class="row body">
            <div class="col-12">
                <div>
                    <div class="info">
                        @php
                         echo $policy->data_values->details
                        @endphp
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=======-** Privacy Policy End **-=======-->
@endsection

@push('style')
    <style>
        .wyg h1,
        .wyg h2,
        .wyg h3,
        .wyg h4 {
            color: hsl(var(--black));
        }

        .wyg p {
            color: hsl(var(--black));
        }

        .wyg ul {
            margin: 35px;
        }

        .wyg ul li {
            list-style-type: disc;
            color: hsl(var(--black));
            font-family: var(--body-font);
        }

    </style>
@endpush
