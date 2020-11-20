import React from "react";
import __ from "../utils/trans";
import { Logo, Facebook, Instagram, Cp, Mail } from "../icons/footer";
import { Unstyled } from "../components/menu";
import Subscribe from "../components/subscribe";
import { Link } from "react-router-dom";

export default function Footer(props) {

    return (
        <footer className="footer">
            <div className="footer-top">
                <div className="container">
                    <div className="row d-none d-xl-flex">
                        <div className="col-xl-15">
                            <Link to="/" className="footer-logo" style={{ marginLeft: "-1rem" }}>
                                <Logo />
                            </Link>
                            <div className="mail-to d-flex flex-column">
                                <div className="mb-1">
                                    {__("FOR_PARTNER_FOOTER")}
                                </div>
                                <div className="h5">
                                    <a href="mailto:info@act-art.ru">
                                        info@act-art.ru
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div className={`col-xl-10 footer-left-menu`}>
                            <Unstyled
                                items={window.App.menus.footerLeft}
                            />
                        </div>
                        <div className={`col-xl-15 footer-right-menu`}>
                            <Unstyled
                                items={window.App.menus.footerRight}
                            />
                        </div>
                        <div className="col-xl-20">
                            <div className="order-2 order-md-1 pb-md-5">
                                <Subscribe {...props} />
                            </div>
                            <div className="order-1 order-md-2 d-flex flex-row soc-wr pb-md-5">
                                <div className="d-none d-xl-block flex-fill pr-2">
                                    <small>
                                        {__("ANNOUNCE_FOOTER_NEWS")}
                                    </small>
                                </div>
                                <div className="mr-3">
                                    <a href="//fb.me/actart.RU">
                                        <Facebook />
                                    </a>
                                </div>
                                <div className="">
                                    <a href="instagram:@actart.RU">
                                        <Instagram />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="row d-none d-md-flex d-xl-none">
                        <div className="col-20">
                            <Link to="/" className="footer-logo">
                                <Logo />
                            </Link>
                            <div className="mail-to d-flex flex-column">
                                <div className="mb-1">
                                    {__("FOR_PARTNER_FOOTER")}
                                </div>
                                <div className="h5">
                                    <a href="mailto:info@act-art.ru">
                                        info@act-art.ru
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div className="col-40">
                            <div className="row mb-5">
                                <div className="col-50">
                                    <Subscribe {...props} />
                                </div>
                                <div className="col-10">
                                    <div className="mr-3">
                                        <a href="//fb.me/actart.RU">
                                            <Facebook />
                                        </a>
                                    </div>
                                    <div className="">
                                        <a href="instagram:@actart.RU">
                                            <Instagram />
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div className="row">
                                <div className="col-30 footer-left-menu">
                                    <Unstyled
                                        items={window.App.menus.footerLeft}
                                    />
                                </div>
                                <div className="col-30 footer-right-menu">
                                    <Unstyled
                                        items={window.App.menus.footerRight}
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div className="footer-bottom">
                <div className="container">
                    <div className="row">
                        <div className="col-xl-25">
                            <p className="pb-2" style={{ maxWidth: "20rem" }}>
                                {__("COPYRIGHT_FOOTER")}
                                <br />
                                {__(
                                    "When using materials from the site, a link to the site is required."
                                )}
                            </p>
                        </div>
                        <div className="col-xl-15">
                            <Unstyled items={window.App.menus.copyright} />
                        </div>
                        <div className="col-xl-20">
                            <div className="row">
                                <div className="col-30">
                                    <a className="color-inherit mr-2" target="_blank" href="//good-head.ru/">
                                        <div className="pb-2">
                                            {__("SITE_MADE_IN")}
                                        </div>
                                        <div className="pb-2">
                                            <img src="/images/kuba-logo.png" alt="" style={{ width: "3rem", backgroundColor: "#ffffff" }} />
                                        </div>
                                    </a>
                                </div>
                                <div className="col-30">
                                    <a className="color-inherit" target="_blank" href="//good-head.ru/">
                                        <div className="pb-2">
                                            {__("DEVELOPMENT")}
                                        </div>
                                        <div className="pb-2">
                                            <Cp />
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    );
}
