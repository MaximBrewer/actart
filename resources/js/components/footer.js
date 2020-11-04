import React from "react";
import { useAuth } from "../context/auth";
import __ from "../utils/trans";
import { Logo, Facebook, Instagram, Cp, Mail } from "../icons/footer";
import { Unstyled } from "../components/menu";
import Subscribe from "../components/subscribe";
import { Link } from "react-router-dom";

export default function Footer(props) {
    let { currentUser } = useAuth();

    return (
        <footer className="footer">
            <div className="footer-top">
                <div className="container">
                    <div className="d-flex flex-column flex-md-row">
                        <div className="order-1 d-none d-md-block">
                            <Link to="/" className="footer-logo">
                                <Logo />
                            </Link>
                            <div className="mail-to d-flex flex-column">
                                <div className="mb-1">
                                    {__("For partnership:")}
                                </div>
                                <div className="h5">
                                    <a href="mailto:info@act-art.ru">
                                        info@act-art.ru
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div className="d-flex flex-column order-2 flex-xl-row">
                            <div className="order-2 d-flex flex-column d-md-none">
                                <div className="mail-to d-flex flex-column">
                                    <div className="mb-1">
                                        {__("For partnership:")}
                                    </div>
                                    <div className="h5">
                                        <a href="mailto:info@act-art.ru">
                                            info@act-art.ru
                                        </a>
                                    </div>
                                </div>
                                <Link to="/" className="footer-logo">
                                    <Logo />
                                </Link>
                            </div>
                            <div className="d-flex flex-column flex-md-row order-3 order-md-2 order-xl-1 col-xl-30">
                                <div className="order-2 order-md-1 footer-left-menu">
                                    <Unstyled
                                        items={window.App.menus.footerLeft}
                                    />
                                    <div className="d-sm-none">
                                        <Unstyled
                                            items={window.App.menus.copyright}
                                        />
                                    </div>
                                </div>
                                <div className="order-1 order-md-2 footer-right-menu">
                                    <Unstyled
                                        items={window.App.menus.footerRight}
                                    />
                                </div>
                            </div>
                            <div className="order-1 order-md-1 d-flex flex-column flex-md-row flex-xl-column order-xl-2 col-xl-30">
                                <div className="order-2 order-md-1 pb-md-5">
                                    <Subscribe {...props} />
                                </div>
                                <div className="order-1 order-md-2 d-flex flex-row soc-wr pb-md-5">
                                    <div className="d-none d-xl-block flex-fill">
                                        <small>
                                            {__(
                                                "Анонсы, статьи, новости мира искусства:"
                                            )}
                                        </small>
                                    </div>
                                    <div className="mr-3">
                                        <a href="#">
                                            <Facebook />
                                        </a>
                                    </div>
                                    <div className="">
                                        <a href="#">
                                            <Instagram />
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div className="footer-bottom">
                <div className="container">
                    <div className="row">
                        <div className="col-md-20 align-items-center align-items-md-start d-flex">
                            <p className="pb-2">
                                {__("ООО “ВОЛОН”  © 2020")}
                                <br />
                                {__(
                                    "When using materials from the site, a link to the site is required."
                                )}
                            </p>
                        </div>
                        <div className="col-md-20 align-items-center align-items-md-start d-none d-sm-flex">
                            <Unstyled items={window.App.menus.copyright} />
                        </div>
                        <div className="col-md-20 align-items-center align-items-md-start">
                            <div className="d-xl-flex">
                                <div className="pb-2">
                                    {__("Сайт сделан в  ВАША КОМПАНИЯ")}
                                </div>
                                <div className="d-md-flex">
                                    <div className="pb-2">
                                        {__("Разработка")}
                                    </div>
                                    <div className="pb-2">
                                        <Cp />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    );
}
