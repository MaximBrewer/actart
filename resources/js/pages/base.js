import React, { useState, useEffect, useRef } from "react";
import { Link, useParams, useLocation, useHistory } from "react-router-dom";
import __ from "../utils/trans";
import YandexShare from "react-yandex-share";
import Parser from "../utils/parser";
import client from "../api/client";
import Feedback from "../components/forms/Feedback";

export default function Base(props) {
    const { req } = props;
    const [state, setState] = useState({ page: null });

    const { pathname } = useLocation();
    let history = useHistory();

    useEffect(() => {
        setState(prevState => {
            return {
                ...prevState,
                page: null
            };
        });
        req("/api/" + window.App.locale + "/page" + pathname)
            .then(({ page }) =>
                setState(prevState => {
                    document.title = page.seo_title ? page.seo_title : page.title;
                    document.querySelector('meta[name="description"]').setAttribute("content", page.meta_description ? page.meta_description : window.App.meta_description);
                    document.querySelector('meta[name="keywords"]').setAttribute("content", page.meta_keywords ? page.meta_keywords : window.App.meta_keywords);
                    return {
                        ...prevState,
                        page
                    };
                })
            )
            .catch(() => null);
    }, [pathname]);

    return state.page ? (
        <div className="sticky-wrapper">
            <section id="page" className={state.page.image ? `dotted` : ``}>
                <div className="container">
                    <div className="row pb-2 pb-lg-5">
                        <div
                            className={
                                state.page.image
                                    ? `col-xl-30 col-xxl-28`
                                    : `col-xl-60`
                            }
                        >
                            <h2 className="h2">{state.page.title}</h2>
                            <hr />
                            <div className="sub_h2 d-none d-xl-block">
                                {Parser(state.page.excerpt ?? "")}
                            </div>
                        </div>
                        {state.page.image ? (
                            <div className="col-xl-30 col-xxl-32 d-none d-xl-block">
                                <div
                                    className="image-wrapper"
                                    style={{
                                        backgroundImage: `url(${encodeURI(
                                            state.page.image
                                        )})`
                                    }}
                                ></div>
                            </div>
                        ) : (
                            ``
                        )}
                    </div>
                    <div className="row">
                        <div className="col-60">
                            <Parser
                                body={state.page.body}
                                entity={`page`}
                                id={state.page.id}
                                {...props}
                            />
                        </div>
                    </div>
                    <hr />
                    {props.contacts ? (
                        <>
                            <Feedback {...props} />
                            <hr />
                        </>
                    ) : (
                        ``
                    )}
                    <div
                        onClick={() => history.goBack()}
                        className="btn btn-default d-inline-flex justify-content-center align-items-center"
                    >
                        <svg
                            width="24"
                            height="24"
                            viewBox="0 0 39 36"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                d="M20.5946 3L6 18L20.5946 33"
                                stroke="#1B292B"
                                strokeWidth="8"
                            />
                            <path
                                d="M7.62164 17.5946H38.4325"
                                stroke="#1E2B32"
                                strokeWidth="8"
                            />
                        </svg>
                        &nbsp;&nbsp;{__("GO_BACK")}
                    </div>
                </div>
            </section>
            <div className="sticky-section">
                <span>{state.page.title}</span>
            </div>
        </div>
    ) : (
        <div className="sticky-wrapper">
            <section id="page">
                <div className="container">
                    <div className="loading-page">
                        <div className="row">
                            <div className={`col-xl-60`}>
                                <h2 className="h2 title-loading">
                                    <div className="block-loading">
                                        <div className="block-loading-animation">
                                            <span></span>
                                        </div>
                                    </div>
                                </h2>
                                <hr />
                                <div className="sub_h2 subtitle-loading">
                                    <div className="block-loading">
                                        <div className="block-loading-animation">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-60">
                                <div className="block-loading">
                                    <div className="block-loading-animation">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div className="sharing sticky-loading">
                            <br />
                        </div>
                    </div>
                </div>
            </section>
            <div className="sticky-section">
                <span className="sticky-loading"></span>
            </div>
        </div>
    );
}
