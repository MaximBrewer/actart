import React, { useState, useEffect } from "react";
import { Link, useParams } from "react-router-dom";
import __ from "../utils/trans";
import { useAuth } from '../context/auth';
import Marquee from "../components/marquee";
import useDocumentTitle from "../components/document-title";
import WaterfallAjax from "../components/waterfall/WaterfallAjax";

export default function AuthorItem(props) {
    useDocumentTitle(__("AUTHORS_PAGE_TITLE"));
    let { setCurrentUser, currentUser } = useAuth();
    const [state, setState] = useState({ author: null });
    const { id } = useParams();
    const { req } = props;

    const watchAuthor = (e) => {
        e.preventDefault();
        if (!currentUser) {
            openModal('login');
        } else {
            window.dispatchEvent(
                new CustomEvent("flash", {
                    detail: {
                        message: __("WILL_SEND_NOTE_AUTHOR"),
                        type: "success",
                        delay: 4000
                    }
                })
            );
        }
    }

    useEffect(() => {
        req("/api/" + window.App.locale + "/author/" + id)
            .then(({ author }) =>
                setState(prevState => {
                    // document.title = author.title;
                    return {
                        ...prevState,
                        author
                    };
                })
            )
            .catch(() => null);
    }, [id]);

    return state.author ? (
        <React.Fragment>
            <section className="author-page">
                <div className="container">
                    <div className="row pb-2 pb-lg-5">
                        <div className="col-xl-40">
                            <h2 className="h2">
                                {state.author.name + ` ` + state.author.surname}
                            </h2>
                            {state.author.groups &&
                                state.author.groups.length ? (
                                    <div className="h5">
                                        /{state.author.groups[0].title}/
                                    </div>
                                ) : (
                                    ``
                                )}
                            <hr />
                            <div className="d-none d-xl-block description">
                                {state.author.text}
                            </div>
                            <div className="btn-sign">
                                {__(
                                    "You can follow the update of the author's collection or leave a request for the purchase of new works"
                                )}
                            </div>
                            <div className="btn-wrap d-md-flex">
                                <button
                                    type="button"
                                    onClick={watchAuthor}
                                    className="btn btn-default"
                                >
                                    {__("Follow")}
                                </button>
                                <button
                                    onClick={watchAuthor}
                                    type="button"
                                    className="btn btn-primary"
                                >
                                    {__("Purchase requisition")}
                                </button>
                            </div>
                        </div>
                        <div className="col-xl-20 d-none d-xl-block photo-block">
                            <div
                                className="image-wrapper"
                                style={{
                                    backgroundImage:
                                        `url(` + state.author.avatar + `)`,
                                    paddingTop:
                                        (100 * state.author.pxheight) /
                                        state.author.pxwidth +
                                        `%`
                                }}
                            ></div>
                            {state.author.studies &&
                                state.author.studies.length ? (
                                    <div className="exhibitions">
                                        <div className="heading">
                                            {__("STUDIES")}
                                        </div>
                                        <ul className="list-unstyled">
                                            {state.author.studies.map(
                                                (item, index) => (
                                                    <li key={index}>
                                                        {item.title}
                                                    </li>
                                                )
                                            )}
                                        </ul>
                                    </div>
                                ) : (
                                    ``
                                )}
                            {state.author.exhibits &&
                                state.author.exhibits.length ? (
                                    <div className="exhibitions">
                                        <div className="heading">
                                            {__("EXHIBITS")}
                                        </div>
                                        <ul className="list-unstyled">
                                            {state.author.exhibits.map(
                                                (item, index) => (
                                                    <li key={index}>
                                                        {item.title}
                                                    </li>
                                                )
                                            )}
                                        </ul>
                                    </div>
                                ) : (
                                    ``
                                )}
                        </div>
                    </div>
                </div>
            </section>
            <section className="author-works">
                <div className="container">
                    <div className="h2">{__("AUTHORS_WORKS")}</div>
                    <div className="author-works-list">
                        <div className="act-waterfall">
                            <WaterfallAjax
                                {...props}
                                data={{
                                    entity: "lots",
                                    action: "add",
                                    author: state.author.id,
                                    sortable: true,
                                    showStatus: true,
                                    limit: {
                                        xs: 4,
                                        sm: 4,
                                        md: 4,
                                        lg: 3,
                                        xl: 3,
                                        xxl: 4
                                    },
                                    view: {
                                        xs: 1,
                                        sm: 2,
                                        md: 2,
                                        lg: 3,
                                        xl: 3,
                                        xxl: 4
                                    },
                                    tizerView: "gallery"
                                }}
                            />
                        </div>
                    </div>
                    <div className="author-works-footer">
                        <div className="d-md-flex justify-content-center">
                            <Link to="/auctions" className="btn btn-default">
                                {__("Closest auctions")}
                            </Link>
                            <Link to="/gallery" className="btn btn-default">
                                {__("Online-Gallery")}
                            </Link>
                        </div>
                        <div className="d-flex justify-content-center">
                            <Link to="/authors">{__("All authors")}</Link>
                        </div>
                    </div>
                </div>
            </section>
            <Marquee />
        </React.Fragment>
    ) : (
            ``
        );
}
