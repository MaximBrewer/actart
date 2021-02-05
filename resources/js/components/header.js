import React, { useState, useEffect, useRef } from "react";
import { useAuth } from "../context/auth";
import __ from "../utils/trans";
import {
    Lens,
    Close,
    CloseTablet as CloseTabletIcon,
    CloseMobile as CloseMobileIcon,
    TopLogo,
    Burger,
    SmallTopLogo,
    Profile,
    Logo,
    LogoMenuMobile
} from "../icons/header";
import { Unstyled, Top, Topmost } from "./menu";
import Search from "./search";
import Subscribe from "./subscribe";
import Parser from "html-react-parser";
import {
    Link,
    useLocation,
    useHistory,
    useRouteMatch,
    useParams
} from "react-router-dom";

export default function Header(props) {
    const { openModal, closeModal } = props;
    const { pathname } = useLocation();
    const mobileMenuEl = useRef(null);
    const [state, setState] = useState({
        openedSearch: false
    });

    const openSearch = () => {
        setState(prevState => ({
            ...prevState,
            openedSearch: true
        }));
    };

    const closeSearch = () => {
        setState(prevState => ({
            ...prevState,
            openedSearch: false
        }));
    };

    let { currentUser } = useAuth();
    useEffect(() => {
        closeMobile();
        document.body.className = pathname == "/" ? "home" : "";
        if (!window.skipScroll && pathname.indexOf("gallery/category") == -1) {
            window.scrollTo(0, 0);
        }
        window.skipScroll = false;
        changeWindow();
    }, [pathname]);

    useEffect(() => {
        changeWindow();
    }, []);

    document.addEventListener("scroll", () => changeWindow());
    window.addEventListener("resize", () => changeWindow());

    const changeWindow = () => {
        let mf = document.getElementById("header-full-menu-fixed");
        if (!!mf && mf.style.display == "block") {
            mf.style.display = "none";
        }
        if (document.body.classList.contains("home")) {
            if (window.innerWidth > 1279) {
                document.getElementById("header-full-menu").style.display =
                    "block";
                let scrollTop =
                        document.documentElement.scrollTop ||
                        (document.body && document.body.scrollTop) ||
                        0,
                    header = document.getElementById("header"),
                    headerTop = document.getElementById("header-top");

                document.getElementById("header-full-menu").style.paddingTop =
                    headerTop.offsetHeight + "px";

                let buttons = document.querySelectorAll("#header-top .btn");
                if (scrollTop + headerTop.offsetHeight > header.offsetHeight) {
                    headerTop.classList.remove("bg-dark");
                    headerTop.classList.add("short-header-top");
                    [].forEach.call(buttons, function(button) {
                        button.classList.remove("btn-default-inverse");
                        button.classList.add("btn-primary-inverse");
                    });
                    document
                        .getElementById("header-content")
                        .classList.remove("bg-dark");
                } else {
                    headerTop.classList.add("bg-dark");
                    headerTop.classList.remove("short-header-top");
                    [].forEach.call(buttons, function(button) {
                        button.classList.remove("btn-primary-inverse");
                        button.classList.add("btn-default-inverse");
                    });
                    document
                        .getElementById("header-content")
                        .classList.add("bg-dark");
                }
            } else {
                let headerTop = document.getElementById("header-top"),
                    buttons = document.querySelectorAll("#header-top .btn");
                headerTop.classList.remove("bg-dark");
                headerTop.classList.add("short-header-top");
                [].forEach.call(buttons, function(button) {
                    button.classList.remove("btn-default-inverse");
                    button.classList.add("btn-primary-inverse");
                });
                document.getElementById("header-full-menu") &&
                    (document.getElementById("header-full-menu").style.display =
                        "none");
                document
                    .getElementById("header-content")
                    .classList.remove("bg-dark");
            }
        } else {
            let headerTop = document.getElementById("header-top");
            document.getElementById("header-full-menu").style.display = "none";
            headerTop.classList.remove("bg-dark");
            let buttons = document.querySelectorAll("#header-top .btn");
            [].forEach.call(buttons, function(button) {
                button.classList.remove("btn-default-inverse");
                button.classList.add("btn-primary-inverse");
            });
            document
                .getElementById("header-content")
                .classList.remove("bg-dark");
        }
    };

    const closeMobile = () => {
        mobileMenuEl.current.style.display = "none";
        document.body.style.overflowY = "auto";
    };

    const toggleMenu = () => {
        if (window.innerWidth > 1279) {
            let menu = document.getElementById("header-full-menu-fixed");
            if (menu.style.display == "block") {
                menu.style.display = "none";
            } else {
                let headerTop = document.getElementById("header-top");
                menu.style.marginTop = headerTop.offsetHeight + "px";
                menu.style.paddingTop = "0";
                menu.style.position = "fixed";
                menu.style.display = "block";
                menu.style.left = "0";
                menu.style.top = "0";
                menu.style.background = "white";
                menu.style.width = "100%";
                menu.style.zIndex = "100";
                menu.style.paddingBottom = "2.5rem";
            }
        } else {
            mobileMenuEl.current.style.display = "block";
            document.body.style.overflowY = "hidden";
        }
    };

    return (
        <header className="header" id="header">
            <nav>
                <section className="py-2 header-top" id="header-top">
                    <div className="header-content" id="header-content">
                        <div className="header-top-container-wrapper py-2">
                            <div className="container">
                                <div className="row">
                                    <div className="col col-xl-12"></div>
                                    <div className="col col-xl-24">
                                        <div className="header-top-menu">
                                            <Topmost
                                                items={window.App.menus.topmost}
                                            />
                                        </div>
                                    </div>
                                    <div className="col col-xl-24">
                                        <div className="header-top-search d-none d-xxl-block">
                                            <Search closeSearch={closeSearch} />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="container-fluid">
                            <div className="row header-wide">
                                <div className="col-md-20 col-30 hide-dark">
                                    <Link
                                        to="/"
                                        className="logo text-decoration-none"
                                    >
                                        <div className="align-items-center d-none d-md-flex">
                                            <TopLogo />
                                        </div>
                                        <div className="align-items-center d-flex d-md-none">
                                            <SmallTopLogo />
                                        </div>
                                        <div className="text-nowrap ml-4 align-items-center d-none d-xl-flex">
                                            {Parser(
                                                __(
                                                    "online-auction<br>of contemporary art"
                                                )
                                            )}
                                        </div>
                                    </Link>
                                </div>
                                <div className="burger-wrapper col-md-20 col-30 hide-dark">
                                    <a
                                        href="#"
                                        onClick={e => {
                                            e.preventDefault();
                                            toggleMenu();
                                        }}
                                        className="burger text-decoration-none align-items-center justify-content-between"
                                        id="burgerMenuToggle"
                                    >
                                        <div>
                                            <Burger />
                                        </div>
                                        <div>{__("Menu")}</div>
                                    </a>
                                </div>
                                <div className="col-md-20 flex-row-reverse right-position d-none d-md-flex">
                                    {/* <div>
                                        {currentUser ? (
                                            <Link
                                                className="icon profile"
                                                to="/profile"
                                            >
                                                <Profile />
                                            </Link>
                                        ) : (
                                            <a
                                                className="btn btn-default-inverse btn-sm"
                                                href="#"
                                                onClick={e => {
                                                    e.preventDefault();
                                                    openModal("login");
                                                }}
                                            >
                                                {Parser(__("Log&nbsp;In"))}
                                            </a>
                                        )}
                                    </div>
                                    <div className="header-lang">
                                        <div className="lang-menu mx-3 text-nowrap">
                                            <a
                                                href="/lang/ru"
                                                className={
                                                    App.locale == "ru"
                                                        ? `active`
                                                        : ``
                                                }
                                            >
                                                Rus
                                            </a>{" "}
                                            |{" "}
                                            <a
                                                href="/lang/en"
                                                className={
                                                    App.locale == "en"
                                                        ? `active`
                                                        : ``
                                                }
                                            >
                                                Eng
                                            </a>
                                        </div>
                                    </div>
                                    <div className="hide-dark-lens">
                                        {state.openedSearch ? (
                                            <Search
                                                hidden={true}
                                                closeSearch={closeSearch}
                                            />
                                        ) : (
                                            <a
                                                href="#"
                                                onClick={e => {
                                                    e.preventDefault();
                                                    openSearch();
                                                }}
                                            >
                                                <Lens />
                                            </a>
                                        )}
                                    </div> */}
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section className="header-full-menu" id="header-full-menu">
                    <div className="container mt-4">
                        <div className="header-bottom-logo">
                            <Link to="/" className="header-logo">
                                <Logo />
                                <p className="h5 py-4">
                                    {Parser(
                                        __(
                                            "online-auction<br>of contemporary art"
                                        )
                                    )}
                                </p>
                            </Link>
                        </div>
                        <div className="row header-bottom-menu flex-row-reverse">
                            <div className="col col-xl-12">
                                <Top items={window.App.menus.topmost} />
                            </div>
                            <div className="col col-xl-12">
                                <Top items={window.App.menus.top4} />
                            </div>
                            <div className="col col-xl-12">
                                <Top items={window.App.menus.top3} />
                            </div>
                            <div className="col col-xl-12">
                                <Top items={window.App.menus.top2} />
                            </div>
                            <div className="col col-xl-12">
                                <Top items={window.App.menus.top1} />
                            </div>
                        </div>
                    </div>
                </section>
                <div className="mobile-menu-wrapper" ref={mobileMenuEl}>
                    <div className="bg" onClick={closeMobile}></div>
                    <section className="mobile-menu">
                        <div className="d-block">
                            <div className="p-4 d-flex justify-content-between mobile-menu-header">
                                <Link to="/" className="logo-mobile d-md-none">
                                    <LogoMenuMobile />
                                </Link>
                                <a
                                    href="#"
                                    className="close-tablet d-none d-md-block"
                                    onClick={closeMobile}
                                >
                                    <CloseTabletIcon />
                                </a>
                                <div className="lang-menu text-nowrap d-none d-md-block">
                                    <a
                                        href="/lang/ru"
                                        className={
                                            App.locale == "ru" ? `active` : ``
                                        }
                                    >
                                        Rus
                                    </a>{" "}
                                    |{" "}
                                    <a
                                        href="/lang/en"
                                        className={
                                            App.locale == "en" ? `active` : ``
                                        }
                                    >
                                        Eng
                                    </a>
                                </div>
                                <a
                                    href="#"
                                    className="close-mobile d-md-none"
                                    onClick={closeMobile}
                                >
                                    <CloseMobileIcon />
                                </a>
                            </div>
                            <div className="p-4">
                                <div className="menu-1">
                                    <Unstyled items={window.App.menus.mobile} />
                                </div>
                                <div className="menu-2">
                                    <Unstyled
                                        items={window.App.menus.mobile2}
                                    />
                                </div>
                                <div className="menu-3">
                                    <Unstyled
                                        items={window.App.menus.mobile3}
                                    />
                                </div>
                            </div>
                        </div>
                        <div className="p-4 d-flex justify-content-between d-md-none">
                            {currentUser ? (
                                <Link to="/profile">{__("кабинет")}</Link>
                            ) : (
                                <a
                                    href="#"
                                    onClick={e => {
                                        e.preventDefault();
                                        closeMobile();
                                        openModal("login");
                                    }}
                                >
                                    {Parser(__("Log&nbsp;In"))}
                                </a>
                            )}
                            <div className="lang-menu text-nowrap">
                                <a
                                    href="/lang/ru"
                                    className={
                                        App.locale == "ru" ? `active` : ``
                                    }
                                >
                                    Rus
                                </a>{" "}
                                |{" "}
                                <a
                                    href="/lang/en"
                                    className={
                                        App.locale == "en" ? `active` : ``
                                    }
                                >
                                    Eng
                                </a>
                            </div>
                        </div>
                    </section>
                </div>
            </nav>
            <section
                className="header-full-menu"
                id="header-full-menu-fixed"
                style={{ display: "none" }}
            >
                <div className="container mt-4">
                    <div className="header-bottom-logo">
                        <Link to="/" className="header-logo">
                            <Logo />
                            <p className="h5 py-4">
                                {Parser(
                                    __("online-auction<br>of contemporary art")
                                )}
                            </p>
                        </Link>
                    </div>
                    <div className="row header-bottom-menu flex-row-reverse">
                        <div className="col col-xl-12">
                            <Top items={window.App.menus.topmost} />
                        </div>
                        <div className="col col-xl-12">
                            <Top items={window.App.menus.top4} />
                        </div>
                        <div className="col col-xl-12">
                            <Top items={window.App.menus.top3} />
                        </div>
                        <div className="col col-xl-12">
                            <Top items={window.App.menus.top2} />
                        </div>
                        <div className="col col-xl-12">
                            <Top items={window.App.menus.top1} />
                        </div>
                    </div>
                </div>
            </section>
        </header>
    );
}
