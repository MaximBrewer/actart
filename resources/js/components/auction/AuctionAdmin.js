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
        auction: null,
        translation: window.App.translation,
        sold: false
    });

    const startAuction = (e) => {
        e.preventDefault();
        req('/api/auction/' + state.auction.id + '/admin/start', "PATCH")
            .then(() => null)
            .catch(() => null);
    }

    const lastChance = (e) => {
        e.preventDefault();
        req('/api/auction/' + state.auction.id + '/admin/laschance', "PATCH")
            .then(() => null)
            .catch(() => null);
    }

    const sold = (e) => {
        e.preventDefault();
        req('/api/auction/' + state.auction.id + '/admin/sold', "PATCH")
            .then(() => null)
            .catch(() => null);
    }

    const nextLot = (e) => {
        e.preventDefault();
        req('/api/auction/' + state.auction.id + '/admin/nextlot', "PATCH")
            .then(() => null)
            .catch(() => null);
    }

    const finish = (e) => {
        e.preventDefault();
        req('/api/auction/' + state.auction.id + '/admin/finish', "PATCH")
            .then(() => null)
            .catch(() => null);
    }

    const updateTranslation = event => {
        setState(prevState => ({
            ...prevState,
            translation: event.detail.translation
        }));
    };

    const updateAuction = event => {
        setState(prevState => {
            if (event.detail.auction.id == prevState.auction.id)
                return {
                    ...prevState,
                    auction: event.detail.auction
                }
            else
                return prevState;
        });
    };

    useEffect(() => {
        req('/api/' + window.App.locale + "/auctions/" + id)
            .then(({ auction }) =>
                setState(prevState => ({
                    ...prevState,
                    auction: auction
                })))
            .catch(() => null);
        window.addEventListener("update-auction", updateAuction);
        window.addEventListener("update-translation", updateTranslation);
        return () => {
            window.removeEventListener("update-auction", updateAuction);
            window.removeEventListener("update-translation", updateTranslation)
        }
    }, []);

    useEffect(() => {
        if (state.auction && state.auction.lots) {
            let all = true;
            for (const lot of state.auction.lots) {
                if (lot.status == 'auction' || lot.status == 'in_auction') all = false;
            }
            setState(prevState => ({
                ...prevState,
                sold: all
            }))
        }
    }, [state.auction]);

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
                                    <div className="row">
                                        <div className="col-xl-40 col-xxl-38">
                                            <div>
                                                <div style={{ paddingTop: "56.25%", height: 0, position: "relative" }} className={`translation-wrapper`} >
                                                    {Parser(state.translation)}
                                                </div>
                                                <div className={`current`} >
                                                    {state.auction.current ? (
                                                        <div>{state.auction.current.title}</div>
                                                    ) : ``}
                                                </div>
                                            </div>
                                        </div>
                                        <div className="col-xl-20 col-xxl-22">
                                            <div className="lot-carousel-right">
                                                <div className="user-activity">
                                                    {state.auction.current && state.auction.current.bets.length ? (
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
                                                    {!state.sold ?
                                                        (!state.auction.current ?
                                                            <a
                                                                className="btn btn-primary"
                                                                href="#"
                                                                onClick={startAuction}
                                                            >
                                                                <div className="pb-1">{__("ADMIN_START_AUCTION")}</div>
                                                                <div><small>({__("ADMIN_SHOW_FIRST_LOT")})</small></div>
                                                            </a> :
                                                            !state.auction.current.bets.length ?
                                                                (!state.auction.current.lastchance ?
                                                                    <a
                                                                        className="btn btn-danger"
                                                                        href="#"
                                                                        onClick={lastChance}
                                                                    >
                                                                        <div className="pb-1">{__("ADMIN_LAST_CHANCE")}</div>
                                                                    </a> : <a
                                                                        className="btn btn-danger"
                                                                        href="#"
                                                                        onClick={nextLot}
                                                                    >
                                                                        <div className="pb-1">{__("ADMIN_NEXT_LOT")}</div>
                                                                    </a>) :
                                                                <a
                                                                    className="btn btn-danger"
                                                                    href="#"
                                                                    onClick={sold}
                                                                >
                                                                    <div className="pb-1">{__("ADMIN_SOLD")}</div>
                                                                </a>
                                                        ) : (
                                                            <a
                                                                className="btn btn-danger"
                                                                href="#"
                                                                onClick={finish}
                                                            >
                                                                <div className="pb-1">{__("ADMIN_FINISH")}</div>
                                                            </a>
                                                        )
                                                    }
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
