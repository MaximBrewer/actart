import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import __ from '../../utils/trans';
import Parser from "html-react-parser";
import Waterfall from "../waterfall/Waterfall";
import { useAuth } from '../../context/auth';

export default function AuctionAdmin(props) {

    const { req } = props;
    const { id } = useParams();
    const { initializing, currentUser, setCurrentUser } = useAuth();

    const [state, setState] = useState({
        auction: null
    });

    const updateAuction = event => {
        setState(prevState => {
            return {
                ...prevState,
                auction: event.detail.auction
            };
        });
    };

    useEffect(() => {
        req('/api/' + window.App.locale + "/auctions/" + id)
            .then(({ auction }) =>
                setState({
                    auction: auction
                })
            )
            .catch(() => null);
        window.addEventListener("auction", updateAuction);
        return () => window.removeEventListener("auction", updateAuction)
    }, []);

    return (
        <section className="auction-page-wrapper">
            {state.auction ? (
                <div className={`status-` + state.auction.status}>
                    <section
                        className="auction-announce auction-online"
                        style={{
                            backgroundImage: "url(" + state.auction.thumbnail + ")",
                            backgroundPosition: "top center"
                        }}
                    >
                        <div className="darkener">
                            <div className="container">
                                <div className="h1">{state.auction.title}<br /><span className="online">{__('ONLINE_BROADCAST_IN_PROPGRESS_TEXT')}</span></div>
                            </div>
                        </div>
                    </section>
                    <div className="sticky-wrapper">
                        <div className="auction-info">
                            <div className="container">
                                <div className="lot-carousel">
                                    {!!state.auction.current ?
                                        <div className="row">
                                            <div className="col-xl-40 col-xxl-38">
                                                <div style={{ paddingTop: "56.25%", height: 0, position: "relative" }}>
                                                    <iframe style={{ width: "99.9%", height: "99.9%", position: "absolute", top: 0, left: 0, margin: "0.05% auto", display: "block" }} src="https://www.youtube.com/embed/3V7SCWFJvds" frameBorder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowFullScreen></iframe>
                                                </div>
                                            </div>
                                            <div className="col-xl-20 col-xxl-22">
                                                <div className="lot-carousel-right">
                                                    <div className="user-activity">
                                                        {state.auction.current.bets.length ? (
                                                            <div className="last-price">
                                                                <div className="info">
                                                                    <div className="pb-1">${state.auction.current.price}</div>
                                                                    <div>
                                                                        {__("LOT_SEED")}:{" "}
                                                                        <span>#{state.auction.current.bets[0].user_id}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        ) : (
                                                                ``
                                                            )}
                                                        <a
                                                            className="btn btn-danger"
                                                            href="#"
                                                            onClick={e => {
                                                                e.preventDefault();
                                                            }}
                                                        >
                                                            <div className="pb-1">{__("ADMIN_START_AUCTION")}</div>
                                                            <div><small>({__("ADMIN_SHOW_FIRST_LOT")})</small></div>
                                                        </a>
                                                        <a
                                                            className="btn btn-danger"
                                                            href="#"
                                                            onClick={e => {
                                                                e.preventDefault();
                                                            }}
                                                        >
                                                            <div className="pb-1">{__("ADMIN_LAST_CHANCE")}</div>
                                                        </a>
                                                        <a
                                                            className="btn btn-danger"
                                                            href="#"
                                                            onClick={e => {
                                                                e.preventDefault();
                                                            }}
                                                        >
                                                            <div className="pb-1">{__("ADMIN_SOLD")}</div>
                                                        </a>
                                                        <a
                                                            className="btn btn-danger"
                                                            href="#"
                                                            onClick={e => {
                                                                e.preventDefault();
                                                            }}
                                                        >
                                                            <div className="pb-1">{__("ADMIN_NEXT_LOT")}</div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        : ``}
                                </div>
                            </div>
                        </div>
                        <div className="auction-page-inner">
                            <div className="auction-works-list my-5">
                                <div className="container">
                                    <div className="h3">{__("FUTHER_IN_THE_AUCTION")}</div>
                                    <Waterfall
                                        {...props}
                                        items={state.auction.lots}
                                        status={'auction'}
                                        data={{
                                            auction: state.auction,
                                            entity: "lots",
                                            tizerView: "auction",
                                            view: {
                                                xs: 1,
                                                sm: 2,
                                                md: 2,
                                                lg: 4,
                                                xl: 4,
                                                xxl: 4
                                            }
                                        }}
                                    />
                                </div>
                            </div>
                            <div className="my-5">
                                <div className="auction-footer"></div>
                            </div>
                        </div>
                        <div className="sticky-section">
                            <span>{state.auction.title}</span>
                        </div>
                    </div>
                </div>
            ) : (
                    ""
                )}
        </section>
    );
}
