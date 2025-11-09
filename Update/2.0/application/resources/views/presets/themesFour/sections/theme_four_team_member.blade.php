@php
    $team =  getContent('theme_four_team_member.content',true);
    $teamElements = getContent('theme_four_team_member.element',false,6);
@endphp

<!-- ==================== Team Start ==================== -->
<section class="team py-80">
    <div class="container">
        <div class="title">
            <h6>{{__(@$team->data_values->top_heading)}}</h6>
            <h4>{{__(@$team->data_values->heading)}}</h4>
            <p>{{__(@$team->data_values->subheading)}}</p>
        </div>
        <div class="row gy-4 mt-3">
            @foreach($teamElements as $item)
            <div class="col-xl-4 col-lg-6 col-md-6 col-12">
                <div class="card">
                    <div class="d-flex">
                        <div class="thumb">
                            <img src="{{getImage(getFilePath('frontend').'/theme_four_team_member'.'/'.@$item->data_values->agent_image)}}" alt="@lang('image')">
                        </div>
                        <div class="content">
                            <h6>
                                @if(strlen(__(@$item->data_values->name)) >20)
                                    {{substr(__(@$item->data_values->name), 0,20).'...' }}
                                @else
                                    {{__(@$item->data_values->name)}}
                                @endif
                            </h6>
                            <p>
                                @if(strlen(__(@$item->data_values->designation)) >20)
                                    {{substr(__(@$item->data_values->designation), 0,20).'...' }}
                                @else
                                    {{__(@$item->data_values->designation)}}
                                @endif
                            </p>
                            <div class="social">
                                <a href="{{@$item->data_values->facebook_link}}">@php echo @$item->data_values->facebook_icon; @endphp</a>
                                <a href="{{@$item->data_values->twitter_link}}">@php echo @$item->data_values->twitter_icon; @endphp</a>
                                <a href="{{@$item->data_values->instagram_link}}"> @php echo @$item->data_values->instagram_icon; @endphp</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!-- ==================== Team End ==================== -->
