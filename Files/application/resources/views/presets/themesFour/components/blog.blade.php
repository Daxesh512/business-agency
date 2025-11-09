<div class="row gy-4 d-flex justify-content-center mt-2">
    @forelse($blogs as $item)
    <div class="col-xl-3 col-lg-4 col-md-6 col-12">
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
                        @if(strlen(__(@$item->data_values->title)) >25)
                        {{substr(__(@$item->data_values->title), 0,25).'...' }}
                        @else
                        {{__(@$item->data_values->title)}}
                        @endif
                    </h5>
                </a>
                <p>
                    @if (strlen(__(strip_tags(@$item->data_values->description))) > 60)
                    {{ substr(__(strip_tags(@$item->data_values->description)), 0, 60) . '...' }}
                    @else
                    {{__(strip_tags(@$item->data_values->description)) }}
                    @endif
                </p>
            </div>
        </div>
    </div>
    @empty
    <h2 class="text-center">{{__($emptyMessage)}}</h2>
    @endforelse
</div>
