import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import __ from "../../utils/trans";
import Parser from "html-react-parser";
import Waterfall from "../waterfall/Waterfall";

export default function AuctionAdmin(props) {
    const startAuction = e => {
        e.preventDefault();
        req(
            "/api/" +
                window.App.locale +
                "/auction/" +
                state.auction.id +
                "/admin/start",
            "PATCH"
        )
            .then(() => null)
            .catch(() => null);
    };

    const lastChance = e => {
        e.preventDefault();
        req(
            "/api/" +
                window.App.locale +
                "/auction/" +
                state.auction.id +
                "/admin/lastchance",
            "PATCH"
        )
            .then(() => null)
            .catch(() => null);
    };

    const sold = e => {
        e.preventDefault();
        req(
            "/api/" +
                window.App.locale +
                "/auction/" +
                state.auction.id +
                "/admin/sold",
            "PATCH"
        )
            .then(() => null)
            .catch(() => null);
    };

    const nextLot = e => {
        e.preventDefault();
        req(
            "/api/" +
                window.App.locale +
                "/auction/" +
                state.auction.id +
                "/admin/nextlot",
            "PATCH"
        )
            .then(() => null)
            .catch(() => null);
    };

    const finish = e => {
        e.preventDefault();
        req(
            "/api/" +
                window.App.locale +
                "/auction/" +
                state.auction.id +
                "/admin/finish",
            "PATCH"
        )
            .then(() => null)
            .catch(() => null);
    };

    const updateTranslation = event => {
        setState(prevState => ({
            ...prevState,
            translation: event.detail.translation
        }));
    };

    const { req } = props;
    const { id } = useParams();

    const [state, setState] = useState({
        auction: null,
        lots: [],
        next: null,
        translation: window.App.translation,
        finished: false
    });

    const updateLotStatus = event => {
        setState(prevState => {
            let auction = prevState.auction,
                lots = [],
                update = false,
                finished = prevState.finished;

            if (auction.current && auction.current.id == event.detail.id) {
                auction.current.status = event.detail.status;
                update = true;
            }
            for (let i in auction.lots) {
                let lot = auction.lots[i];
                if (lot.id == event.detail.id) {
                    lot.status = event.detail.status;
                    if (event.detail.status == "in_auction")
                        auction.current = lot;
                    update = true;
                }
                lots.push(lot);
            }
            auction.lots = lots;

            if (update) {
                if (auction.current.status != "in_auction")
                    auction.current = null;
                return {
                    ...prevState,
                    auction: auction,
                    finished: finished
                };
            }
            return prevState;
        });
    };

    const updateLotLastchance = event => {
        setState(prevState => {
            let auction = prevState.auction,
                lots = [],
                update = false;
            for (let i in auction.lots) {
                let lot = auction.lots[i];
                if (lot.id == event.detail.id) {
                    lot.lastchance = event.detail.lastchance;
                    if (event.detail.id == auction.current.id)
                        auction.current.lastchance = event.detail.lastchance;
                    update = true;
                }
                lots.push(lot);
            }
            auction.lots = lots;
            if (update)
                return {
                    ...prevState,
                    auction: auction
                };
            return prevState;
        });
    };

    const updateAuctionStatus = event => {
        setState(prevState => {
            if (event.detail.id == prevState.auction.id)
                return {
                    ...prevState,
                    auction: {
                        ...prevState.auction,
                        status: event.detail.status
                    }
                };
            else return prevState;
        });
    };

    const createBet = event => {
        setState(prevState => {
            let auction = prevState.auction,
                lots = [],
                update = false;
            for (let i in auction.lots) {
                let lot = auction.lots[i],
                    bets = lot.bets;
                if (lot.id == event.detail.bet.lot_id) {
                    bets.unshift(event.detail.bet);
                    lot.price = event.detail.bet.bet;
                    if (lot.id == auction.current.id) auction.current = lot;
                    update = true;
                }
                lots.push(lot);
            }
            auction.lots = lots;
            if (update)
                return {
                    ...prevState,
                    auction: auction
                };
            return prevState;
        });
    };

    useEffect(() => {
        req("/api/" + window.App.locale + "/auctions/" + id)
            .then(({ auction }) =>
                setState(prevState => ({
                    ...prevState,
                    auction: auction
                }))
            )
            .catch(() => null);
        window.addEventListener("update-translation", updateTranslation);
        window.addEventListener("update-auction-status", updateAuctionStatus);
        window.addEventListener("update-lot-status", updateLotStatus);
        window.addEventListener("update-lot-lastchance", updateLotLastchance);
        window.addEventListener("create-bet", createBet);
        return () => {
            window.removeEventListener("update-translation", updateTranslation);
            window.removeEventListener(
                "update-auction-status",
                updateAuctionStatus
            );
            window.removeEventListener("update-lot-status", updateLotStatus);
            window.removeEventListener(
                "update-lot-lastchance",
                updateLotLastchance
            );
            window.removeEventListener("create-bet", createBet);
        };
    }, []);

    useEffect(() => {
        if (state.auction && state.auction.lots) {
            let all = true;
            for (const lot of state.auction.lots) {
                if (lot.status == "auction" || lot.status == "in_auction")
                    all = false;
            }
            setState(prevState => ({
                ...prevState,
                finished: all
            }));
        }
    }, [state.auction]);

    const countLots = lots => {
        let cnt = 0;
        for (let lot of lots)
            lot.status == "auction" || (lot.status == "in_auction" && cnt++);
        return cnt;
    };

    return (
        <section className="auction-page-wrapper">
            {state.auction ? (
                <div className={`status-` + state.auction.status}>
                    <section
                        className="auction-announce auction-online"
                        style={{
                            backgroundImage:
                                "url(" + state.auction.thumbnail + ")",
                            backgroundPosition: "top center"
                        }}
                    >
                        <div className="darkener">
                            <div className="container">
                                <div className="h1">
                                    {state.auction.title}
                                    <br />
                                    <span className="online">
                                        {__(
                                            "ONLINE_BROADCAST_IN_PROPGRESS_TEXT"
                                        )}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section className={`top-bar`}>
                        <div className="container">
                            торгуется {state.auction.members} человек(а) /
                            лот(а/ов) {state.auction.lots.length} / осталось{" "}
                            {countLots(state.auction.lots)}
                        </div>
                    </section>
                    <div className="sticky-wrapper">
                        <div className="auction-info">
                            <div className="container">
                                <div className="lot-carousel">
                                    <div className="row">
                                        <div className="col-xl-40 col-xxl-38">
                                            <div>
                                                {state.auction.status ==
                                                    "finished" && true}
                                                {state.auction.status ==
                                                    "coming" && true}
                                                {state.auction.status ==
                                                    "canceled" && true}
                                                <div
                                                    style={{
                                                        paddingTop: "56.25%",
                                                        height: 0,
                                                        position: "relative"
                                                    }}
                                                    className={`translation-wrapper`}
                                                >
                                                    {Parser(state.translation)}
                                                </div>
                                                {state.auction.status ==
                                                    "started" &&
                                                    state.auction.current && (
                                                        <div
                                                            className={`current`}
                                                            style={{
                                                                display: "flex",
                                                                justifyContent:
                                                                    "flex-end"
                                                            }}
                                                        >
                                                            <div
                                                                className="py-2"
                                                                style={{
                                                                    maxWidth:
                                                                        "20rem",
                                                                    width:
                                                                        "100%"
                                                                }}
                                                            >
                                                                <div
                                                                    className="image"
                                                                    alt={
                                                                        state
                                                                            .auction
                                                                            .current
                                                                            .thumbnail
                                                                    }
                                                                    style={{
                                                                        display:
                                                                            "block",
                                                                        position:
                                                                            "relative",
                                                                        backgroundSize:
                                                                            "contain",
                                                                        backgroundRepeat:
                                                                            "no-repeat",
                                                                        backgroundPosition:
                                                                            "right bottom",
                                                                        paddingTop:
                                                                            "65%",
                                                                        backgroundColor:
                                                                            "#ECEDED",
                                                                        backgroundImage:
                                                                            'url("' +
                                                                            state
                                                                                .auction
                                                                                .current
                                                                                .thumbnail +
                                                                            '")'
                                                                    }}
                                                                ></div>
                                                            </div>
                                                        </div>
                                                    )}
                                            </div>
                                        </div>
                                        <div className="col-xl-20 col-xxl-22">
                                            <div className="lot-carousel-right">
                                                {state.auction.status ==
                                                    "started" && (
                                                    <div className="user-activity">
                                                        {state.auction
                                                            .current && (
                                                            <div>
                                                                <div className="pb-3 d-flex justify-content-between">
                                                                    <div className="lot-number">
                                                                        {__(
                                                                            "LOT_TEXT_LOT_ID"
                                                                        )}{" "}
                                                                        {
                                                                            state
                                                                                .auction
                                                                                .current
                                                                                .sort
                                                                        }
                                                                    </div>
                                                                </div>
                                                                <div className="lot-author">
                                                                    {
                                                                        state
                                                                            .auction
                                                                            .current
                                                                            .author
                                                                    }
                                                                </div>
                                                                <div className="lot-title">
                                                                    {
                                                                        state
                                                                            .auction
                                                                            .current
                                                                            .title
                                                                    }
                                                                </div>
                                                                <div className="matherial">
                                                                    {state.auction.current.materials.map(
                                                                        (
                                                                            m,
                                                                            mi
                                                                        ) => (
                                                                            <span
                                                                                key={
                                                                                    mi
                                                                                }
                                                                            >
                                                                                {
                                                                                    m.title
                                                                                }
                                                                            </span>
                                                                        )
                                                                    )}
                                                                </div>
                                                                <div className="styles">
                                                                    {state.auction.current.styles.map(
                                                                        (
                                                                            m,
                                                                            mi
                                                                        ) => (
                                                                            <span
                                                                                key={
                                                                                    mi
                                                                                }
                                                                            >
                                                                                {
                                                                                    m.title
                                                                                }
                                                                            </span>
                                                                        )
                                                                    )}
                                                                </div>
                                                                <div className="frames">
                                                                    {state.auction.current.frames.map(
                                                                        (
                                                                            m,
                                                                            mi
                                                                        ) => (
                                                                            <span
                                                                                key={
                                                                                    mi
                                                                                }
                                                                            >
                                                                                {
                                                                                    m.title
                                                                                }
                                                                            </span>
                                                                        )
                                                                    )}
                                                                </div>
                                                                <div className="techniques">
                                                                    {state.auction.current.techniques.map(
                                                                        (
                                                                            m,
                                                                            mi
                                                                        ) => (
                                                                            <span
                                                                                key={
                                                                                    mi
                                                                                }
                                                                            >
                                                                                {
                                                                                    m.title
                                                                                }
                                                                            </span>
                                                                        )
                                                                    )}
                                                                </div>
                                                                <div className="categories">
                                                                    {state.auction.current.categories.map(
                                                                        (
                                                                            m,
                                                                            mi
                                                                        ) => (
                                                                            <span
                                                                                key={
                                                                                    mi
                                                                                }
                                                                            >
                                                                                {
                                                                                    m.title
                                                                                }
                                                                            </span>
                                                                        )
                                                                    )}
                                                                </div>
                                                                <div className="size">
                                                                    {
                                                                        state
                                                                            .auction
                                                                            .current
                                                                            .width
                                                                    }{" "}
                                                                    х{" "}
                                                                    {
                                                                        state
                                                                            .auction
                                                                            .current
                                                                            .height
                                                                    }{" "}
                                                                    {__(
                                                                        "MEASURE_CM"
                                                                    )}
                                                                    {state
                                                                        .auction
                                                                        .current
                                                                        .year
                                                                        ? ` / ` +
                                                                          state
                                                                              .auction
                                                                              .current
                                                                              .year +
                                                                          ` ` +
                                                                          __(
                                                                              "SHORT_YEAR"
                                                                          )
                                                                        : ``}
                                                                </div>
                                                                <div className="start-price">
                                                                    <span>
                                                                        {__(
                                                                            "LOT_START_PRICE"
                                                                        )}
                                                                        : $
                                                                        {
                                                                            state
                                                                                .auction
                                                                                .current
                                                                                .startPrice
                                                                        }
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        )}
                                                        {state.auction
                                                            .current &&
                                                        state.auction.current
                                                            .bets.length ? (
                                                            <div className="last-price">
                                                                <div className="info">
                                                                    <div className="pb-1">
                                                                        $
                                                                        {
                                                                            state
                                                                                .auction
                                                                                .current
                                                                                .price
                                                                        }
                                                                    </div>
                                                                    <div>
                                                                        {__(
                                                                            "LOT_SEED"
                                                                        )}
                                                                        :{" "}
                                                                        <span>
                                                                            #
                                                                            {
                                                                                state
                                                                                    .auction
                                                                                    .current
                                                                                    .bets[0]
                                                                                    .user_id
                                                                            }
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        ) : (
                                                            ``
                                                        )}
                                                        {!state.finished ? (
                                                            !state.auction
                                                                .current ? (
                                                                <a
                                                                    className="btn btn-primary"
                                                                    href="#"
                                                                    onClick={
                                                                        startAuction
                                                                    }
                                                                >
                                                                    <div className="pb-1">
                                                                        {__(
                                                                            "ADMIN_START_AUCTION"
                                                                        )}
                                                                    </div>
                                                                    <div>
                                                                        <small>
                                                                            (
                                                                            {__(
                                                                                "ADMIN_SHOW_FIRST_LOT"
                                                                            )}
                                                                            )
                                                                        </small>
                                                                    </div>
                                                                </a>
                                                            ) : !state.auction
                                                                  .current.bets
                                                                  .length ? (
                                                                !state.auction
                                                                    .current
                                                                    .lastchance ? (
                                                                    <a
                                                                        className="btn btn-danger"
                                                                        href="#"
                                                                        onClick={
                                                                            lastChance
                                                                        }
                                                                    >
                                                                        <div className="pb-1">
                                                                            {__(
                                                                                "ADMIN_LAST_CHANCE"
                                                                            )}
                                                                        </div>
                                                                    </a>
                                                                ) : (
                                                                    <a
                                                                        className="btn btn-danger"
                                                                        href="#"
                                                                        onClick={
                                                                            nextLot
                                                                        }
                                                                    >
                                                                        <div className="pb-1">
                                                                            {__(
                                                                                "ADMIN_NEXT_LOT"
                                                                            )}
                                                                        </div>
                                                                    </a>
                                                                )
                                                            ) : (
                                                                <a
                                                                    className="btn btn-danger"
                                                                    href="#"
                                                                    onClick={
                                                                        sold
                                                                    }
                                                                >
                                                                    <div className="pb-1">
                                                                        {__(
                                                                            "ADMIN_SOLD"
                                                                        )}
                                                                    </div>
                                                                </a>
                                                            )
                                                        ) : (
                                                            <a
                                                                className="btn btn-danger"
                                                                href="#"
                                                                onClick={finish}
                                                            >
                                                                <div className="pb-1">
                                                                    {__(
                                                                        "ADMIN_FINISH"
                                                                    )}
                                                                </div>
                                                            </a>
                                                        )}
                                                    </div>
                                                )}
                                                {state.auction.status ==
                                                    "finished" && (
                                                    <div className="user-activity">
                                                        <h3
                                                            className={`py-5 text-center`}
                                                        >
                                                            {__(
                                                                "AUCTION_HAS_FINISHED"
                                                            )}
                                                        </h3>
                                                    </div>
                                                )}
                                                {state.auction.status ==
                                                    "coming" && (
                                                    <div className="user-activity">
                                                        <h3
                                                            className={`py-5 text-center color-red`}
                                                        >
                                                            {__(
                                                                "AUCTION_WILL_START_SOON"
                                                            )}
                                                        </h3>
                                                    </div>
                                                )}
                                                {state.auction.status ==
                                                    "canceled" && (
                                                    <div className="user-activity">
                                                        <h3
                                                            className={`py-5 text-center`}
                                                        >
                                                            {__(
                                                                "AUCTION_HAS_CANCELED"
                                                            )}
                                                        </h3>
                                                    </div>
                                                )}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {!state.finished && (
                            <div className="auction-page-inner">
                                <div className="auction-works-list my-5">
                                    <div className="container">
                                        <div className="h3">
                                            {__("FUTHER_IN_THE_AUCTION")}
                                        </div>
                                        <Waterfall
                                            {...props}
                                            items={state.auction.lots}
                                            status={"auction"}
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
                        )}
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
