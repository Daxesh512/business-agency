@php
$languages = App\Models\Language::all();
$user =  auth()->user();
@endphp
<nav class="navbar-wrapper">
    <div class="navbar-wrapper-area">
        <div class="dashboard-title-part">
            <h5 class="title">{{__($pageTitle)}}</h5>
        </div>
        <div class="navbar__right">
            <ul class="navbar__action-list">
                <select class="switch-ltr-rtl select-dir mx-2 langSel select" name="lang_switcher">
                    @foreach ($languages as $language)
                    <option value="{{ $language->code }}"
                        @if(Session::get('lang')===$language->code) selected @endif>
                        {{ __($language->name) }}
                    </option>
                    @endforeach
                </select>
                <li class="dropdown">
                    <button type="button" data-bs-toggle="dropdown" data-display="static"
                        aria-haspopup="true" aria-expanded="false">
                        <span class="navbar-user">
                            <span class="navbar-user__thumb"> <img src="{{ getImage(getFilePath('userProfile').'/'.@$user->image,getFileSize('userProfile')) }}"  alt="@lang('user profile')"></span>
                            <span class="navbar-user__info">
                                <span class="navbar-user__name">{{($user->username)}}</span>
                            </span>
                            <span class="icon"><i class="las la-chevron-circle-down"></i></span>
                        </span>
                    </button>
                    <div class="dropdown-menu dropdown-menu--sm p-0 border-0  dropdown-menu-right">
                        <a href="{{ route('user.profile.setting') }}"
                            class="dropdown-menu__item d-flex align-items-center ps-3 pe-3 pt-2 pb-2">
                            <i class="dropdown-menu__icon las la-user-circle"></i>
                            <span class="dropdown-menu__caption">@lang('Profile')</span>
                        </a>
                        <a href="{{ route('user.change.password') }}"
                            class="dropdown-menu__item d-flex align-items-center ps-3 pe-3 pt-2 pb-2">
                            <i class="dropdown-menu__icon las la-key"></i>
                            <span class="dropdown-menu__caption">@lang('Password')</span>
                        </a>
                        <a href="{{ route('user.twofactor') }}"
                            class="dropdown-menu__item d-flex align-items-center ps-3 pe-3 pt-2 pb-2">
                            <i class="dropdown-menu__icon las la-user-check"></i>
                            <span class="dropdown-menu__caption">@lang('2F Security')</span>
                        </a>
                        <a href="{{route('user.logout')}}"
                            class="dropdown-menu__item d-flex align-items-center ps-3 pe-3 pt-2 pb-2">
                            <i class="dropdown-menu__icon las la-sign-out-alt"></i>
                            <span class="dropdown-menu__caption">@lang('Logout')</span>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
