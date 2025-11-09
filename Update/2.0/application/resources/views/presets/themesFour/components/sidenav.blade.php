<div class="sidebar">
    <div class="sidebar__inner">
        <div class="sidebar-top-inner">
            <div class="sidebar__logo">
                <a href="{{route('home')}}" class="sidebar__main-logo">
                    <img src="{{ getImage(getFilePath('logoIcon') . '/logo.png', '?' . time()) }}"
                    alt="{{ config('app.name') }}">
                </a>
                <div class="navbar__left">
                    <button class="navbar__expand">
                        <i class="fas fa-bars-staggered"></i>
                    </button>
                    <button class="sidebar-mobile-menu">
                        <i class="fas fa-bars-staggered"></i>
                    </button>
                </div>
            </div>
            <div class="sidebar__menu-wrapper">
                <ul class="sidebar__menu p-0">
                    <li class="sidebar-menu-item {{ Route::is('user.home') ? 'active' : '' }}">
                        <a href="{{route('user.home')}}">
                            <i class="menu-icon las la-tachometer-alt"></i>
                            <span class="menu-title">@lang('Dashboard')</span>
                        </a>
                    </li>

                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a href="javascript:void(0)">
                            <i class="menu-icon fas fa-cart-arrow-down"></i>
                            <span class="menu-title">@lang('Service Orders')</span>
                        </a>
                        <ul class="sidebar-submenu {{ isActiveRoute('user.orders') || isActiveRoute('user.approved.orders')|| isActiveRoute('user.pending.orders') ? 'd-block' : '' }}">
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('user.orders') ? 'active' : '' }}">
                                <a href="{{route('user.orders')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('All Orders')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('user.approved.orders') ? 'active' : '' }}">
                                <a href="{{route('user.approved.orders')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('Approved Orders')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('user.pending.orders') ? 'active' : '' }}">
                                <a href="{{route('user.pending.orders')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('Pending Orders')</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a href="javascript:void(0)">
                            <i class="menu-icon las la-dollar-sign"></i>
                            <span class="menu-title">@lang('Deposit')</span>
                        </a>
                        <ul class="sidebar-submenu {{ isActiveRoute('user.deposit') ? 'd-block' : '' }}">
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('user.deposit') ? 'active' : '' }}">
                                <a href="{{route('user.deposit')}}" class="nav-link">
                                    <i class="menu-icon las la-plus"></i>
                                    <span class="menu-title">@lang('Deposit Now')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('user.deposit.history') ? 'active' : '' }}">
                                <a href="{{route('user.deposit.history')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('Deposit Log')</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-menu-item {{ Route::is('user.fetch.subscription') ? 'active' : '' }}">
                        <a href="{{route('user.fetch.subscription')}}">
                            <i class="menu-icon las la-gift"></i>
                            <span class="menu-title">@lang('Subscribe Packages')</span>
                        </a>
                    </li>

                    <li class="sidebar-menu-item {{ Route::is('user.transactions') ? 'active' : '' }}">
                        <a href="{{route('user.transactions')}}">
                            <i class="menu-icon las la-hand-holding-usd"></i>
                            <span class="menu-title">@lang('Transactions')</span>
                        </a>
                    </li>

                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a href="javascript:void(0)">
                            <i class="menu-icon las fas fa-headset"></i>
                            <span class="menu-title">@lang('Support Tickets')</span>
                        </a>
                        <ul class="sidebar-submenu {{ isActiveRoute('ticket') ? 'd-block' : '' }}">
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('ticket') ? 'active' : '' }}">
                                <a href="{{ route('ticket') }}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('My Tickets')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('ticket.open') ? 'active' : '' }}">
                                <a href="{{ route('ticket.open') }}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('New Ticket')</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="sidebar-support-box d-grid align-items-center bg-img"
        data-background="{{ asset($activeTemplateTrue . 'images/sidebar-bg.png') }}">
        <div class="sidebar-support-icon">
            <i class="fas fa-question-circle"></i>
        </div>
        <div class="sidebar-support-content">
            <h4 class="title">@lang('Need Help')?</h4>
            <p>@lang('Please contact our support').</p>
            <div class="sidebar-support-btn">
                <a href="{{route('ticket.open')}}" class="btn--base w-100 mt-2">@lang('Get Support')</a>
            </div>
        </div>
    </div>
    </div>
</div>
