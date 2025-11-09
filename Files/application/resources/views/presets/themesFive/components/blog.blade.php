
<div class="row gy-4 justify-content-center mt-2">
    @foreach($blogs as $item)
    <div class="col-xl-4 col-lg-4 col-md-6 col-12">
        <div class="card">
            <div class="thumb">
                <img src="{{getImage(getFilePath('blog').'/'.'thumb_'.@$item->data_values->blog_image)}}" alt="@lang('image')">
            </div>
            <div class="content">
                <div class="date">
                    <p><i class="fas fa-calendar-week"></i> {{showDateTime($item->created_at)}}</p>
                </div>
                <a href="{{ route('blog.details', ['slug' => slug($item->data_values->title), 'id' => $item->id])}}">
                    <h5>
                        @if(strlen(__(@$item->data_values->title)) >30)
                        {{substr(__(@$item->data_values->title), 0,30).'...' }}
                        @else
                        {{__(@$item->data_values->title)}}
                        @endif
                    </h5>
                </a>
                <p>
                    @if (strlen(__(strip_tags(@$item->data_values->description))) > 40)
                    {{ substr(__(strip_tags(@$item->data_values->description)), 0, 40) . '...' }}
                    @else
                    {{ __(strip_tags(@$item->data_values->description)) }}
                    @endif
                </p>
                <a href="{{ route('blog.details', ['slug' => slug($item->data_values->title), 'id' => $item->id])}}">@lang('Read More')</a>
            </div>
        </div>
    </div>
    @endforeach
</div>
