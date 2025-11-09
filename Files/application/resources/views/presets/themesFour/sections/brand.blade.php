@php
    $brandElements = getContent('brand.element',false);
@endphp
<!-- ==================== brand start ==================== -->
<section class="brand py-80">
    <div class="container">
        <div class="brand-slider">
            @foreach($brandElements as $item)
            <div class="d-flex justify-content-center">
                <a href="{{$item->data_values->url}}">
                    <img src="{{getImage(getFilePath('brand').'/'.@$item->data_values->brand_image)}}" alt="@lang('image')">
                </a>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!-- ==================== brand end ==================== -->
