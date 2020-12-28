import React, { useState, useEffect } from "react";
import __ from "../../utils/trans";
import Carousel from "./carousel/Carousel";
import AuctionComingTop from "./coming/Top.js";
import AuctionComingLotTop from "./coming/LotTop.js";
import AuctionComingCenter from "./coming/Center.js";
import AuctionComingBottom from "./coming/Bottom.js";
import AuctionComingLotBottom from "./coming/LotBottom.js";
import AuctionComingLotsList from "./coming/LotsList.js";
import AuctionOnlineTop from "./online/Top.js";
import AuctionOnlineLotTop from "./online/LotTop.js";
import AuctionOnlineCenter from "./online/Center.js";
import AuctionOnlineBottom from "./online/Bottom.js";
import AuctionOnlineLotBottom from "./online/LotBottom.js";
import AuctionOnlineLotsList from "./online/LotsList.js";
import AuctionArchiveTop from "./archive/Top.js";
import AuctionArchiveLotTop from "./archive/LotTop.js";
import AuctionArchiveCenter from "./archive/Center.js";
import AuctionArchiveBottom from "./archive/Bottom.js";
import AuctionArchiveLotBottom from "./archive/LotBottom.js";
import AuctionArchiveLotsList from "./archive/LotsList.js";
import {
    Link,
    useLocation,
    useHistory,
    useRouteMatch,
    useParams
} from "react-router-dom";

export default function Auction(props) {
    const { id } = useParams();


    const [state, setState] = useState({
        auction: null,
        finished: false,
        started: false,
        translation: window.App.translation,
        lbOpen: false
    });

    const updateTranslation = event => {
        setState(prevState => ({
            ...prevState,
            translation: event.detail.translation
        }));
    };

    const updateLotLastChance = event => {
        setState(prevState => {
            let auction = prevState.auction,
                lots = [],
                update = false;
            if (auction.current && auction.current.id == event.detail.id) {
                auction.current.lastchance = event.detail.lastchance;
                update = true;
            }
            for (let i in auction.lots) {
                let lot = auction.lots[i];
                if (lot.id == event.detail.id) {
                    lot.lastchance = event.detail.lastchance;
                    update = true;
                }
                lots.push(lot);
            }
            auction.lots = lots;
            if (update) {
                return {
                    ...prevState,
                    auction
                };
            }
            return prevState;
        });
    };

    const updateLotStatus = event => {
        setState(prevState => {
            let auction = prevState.auction,
                lots = [],
                started = prevState.auction.current ? true : prevState.started,
                update = false;
            if (auction.current && auction.current.id == event.detail.id) {
                auction.current.status = event.detail.status;
                update = true;
            }
            for (let i in auction.lots) {
                let lot = auction.lots[i];
                if (lot.id == event.detail.id) {
                    lot.status = event.detail.status;
                    if (event.detail.status == "in_auction") {
                        auction.current = lot;
                        started = true;
                    }
                    update = true;
                }
                lots.push(lot);
            }
            auction.lots = lots;
            if (update) {
                let finished = true;
                for (const lot of auction.lots) {
                    if (lot.status == "auction" || lot.status == "in_auction")
                        finished = false;
                }
                if (auction.current.status != "in_auction") {
                    auction.current = null;
                }
                return {
                    ...prevState,
                    started,
                    auction,
                    finished
                };
            }
            return prevState;
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
            if (update) {
                return {
                    ...prevState,
                    auction: auction
                };
            }
            return prevState;
        });
    };

    const { url } = useRouteMatch();
    const { pathname } = useLocation();

    useEffect(() => { }, [pathname]);

    const lotId =
        (pathname == url ? false : pathname.replace(url + "/lot/", "")) * 1;

    useEffect(() => {
        window.addEventListener("update-auction-status", updateAuctionStatus);
        window.addEventListener("update-lot-status", updateLotStatus);
        window.addEventListener("update-lot-lastchance", updateLotLastChance);
        window.addEventListener("create-bet", createBet);
        window.addEventListener("update-translation", updateTranslation);
        axios
            .get("/api/" + window.App.locale + "/auctions/" + id)
            .then(res => {
                setState((prevState) => ({
                    ...prevState,
                    auction: res.data.auction,
                    started: res.data.auction.current ? true : prevState.started
                }));
            })
            .catch(err => {
                console.log(err);
            });
        return () => {
            window.removeEventListener("update-translation", updateTranslation);
            window.removeEventListener(
                "update-auction-status",
                updateAuctionStatus
            );
            window.removeEventListener("update-lot-status", updateLotStatus);
            window.removeEventListener(
                "update-lot-lastchance",
                updateLotLastChance
            );
            window.removeEventListener("create-bet", createBet);
        };
    }, []);

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

    const Top = props => {
        if (state.auction.title)
            switch (state.auction.status) {
                case "started":
                    return lotId ? (
                        <AuctionOnlineLotTop {...props} />
                    ) : (
                            <AuctionOnlineTop {...props} />
                        );
                case "finished":
                    return lotId ? (
                        <AuctionArchiveLotTop {...props} />
                    ) : (
                            <AuctionArchiveTop {...props} />
                        );
                case "coming":
                    return lotId ? (
                        <AuctionComingLotTop {...props} />
                    ) : (
                            <AuctionComingTop {...props} />
                        );
            }
        return false;
    };
    const Center = props => {
        if (state.auction.title)
            switch (state.auction.status) {
                case "started":
                    return <AuctionOnlineCenter {...props} />;
                case "finished":
                    return <AuctionArchiveCenter {...props} />;
                case "coming":
                    return <AuctionComingCenter {...props} />;
            }
        return false;
    };
    const LotsList = props => {
        if (state.auction.title)
            switch (state.auction.status) {
                case "started":
                    return <AuctionOnlineLotsList {...props} />;
                case "finished":
                    return <AuctionArchiveLotsList {...props} />;
                case "coming":
                    return <AuctionComingLotsList {...props} />;
            }
        return false;
    };
    const Bottom = props => {
        if (state.auction.title)
            switch (state.auction.status) {
                case "started":
                    return lotId ? (
                        <AuctionOnlineLotBottom {...props} />
                    ) : (
                            <AuctionOnlineBottom {...props} />
                        );
                case "finished":
                    return lotId ? (
                        <AuctionArchiveLotBottom {...props} />
                    ) : (
                            <AuctionArchiveBottom {...props} />
                        );
                case "coming":
                    return lotId ? (
                        <AuctionComingLotBottom {...props} />
                    ) : (
                            <AuctionComingBottom {...props} />
                        );
            }
        return false;
    };

    return state.auction ? (
        <section className="auction-page-wrapper">
            <div className={`status-` + state.auction.status}>
                <Top auction={state.auction} finished={state.finished} started={state.started} />
                <div className="sticky-wrapper">
                    {lotId ? (
                        <div className="auction-info">
                            <div className="container">
                                <Carousel {...props} auction={state.auction} finished={state.finished} started={state.started} />
                            </div>
                        </div>
                    ) : (
                            state.auction.status == 'started' ? (
                                <div className="auction-info">
                                    <div className="container">
                                        <div className="lot-carousel">
                                            <div className="row">
                                                <div className="col-xl-40 col-xxl-38">
                                                    <div className="left-side">
                                                        <div>
                                                            {auction.current ?
                                                                (
                                                                    <div
                                                                        style={{
                                                                            width: "100%"
                                                                        }}
                                                                    >
                                                                        <div
                                                                            onClick={() =>
                                                                                setState(prevState => ({
                                                                                    ...prevState,
                                                                                    lbOpen: true
                                                                                }))
                                                                            }
                                                                            className="image"
                                                                            alt={
                                                                                auction.current
                                                                                    .thumbnail
                                                                            }
                                                                            style={{
                                                                                cursor: "pointer",
                                                                                display: "block",
                                                                                position: "relative",
                                                                                backgroundSize:
                                                                                    "contain",
                                                                                backgroundRepeat:
                                                                                    "no-repeat",
                                                                                backgroundPosition:
                                                                                    "center",
                                                                                paddingTop: "65%",
                                                                                backgroundColor:
                                                                                    "#ECEDED",
                                                                                backgroundImage:
                                                                                    'url("' +
                                                                                    auction
                                                                                        .current
                                                                                        .thumbnail +
                                                                                    '")'
                                                                            }}
                                                                        ></div>
                                                                        {state.lbOpen && (
                                                                            <Lightbox
                                                                                mainSrc={
                                                                                    auction
                                                                                        .current
                                                                                        .photo
                                                                                }
                                                                                onCloseRequest={() =>
                                                                                    setState(
                                                                                        prevState => ({
                                                                                            ...prevState,
                                                                                            lbOpen: false
                                                                                        })
                                                                                    )
                                                                                }
                                                                            />
                                                                        )}
                                                                    </div>
                                                                ) : ``
                                                            }
                                                            <div
                                                                className={`current d-flex justify-content-between py-2`}
                                                            >
                                                                <div className="h2 color-red">{auction.current ? __("LOT_TEXT_LOT_ID") + ` ` + auction.current.id : ``}</div>
                                                                <div style={{ width: "40%" }}>
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
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="col-xl-20 col-xxl-22">
                                                    <div className="right-side">
                                                        {auction.current ? (
                                                            <Right
                                                                item={auction.current}
                                                                {...props}
                                                            />
                                                        ) : (!started
                                                            ? <h3 className={`py-5 text-center color-red`}>{__("#AUCTION_WILL_START_SOON#")}</h3>
                                                            : !finished
                                                                ? <h3 className={`py-5 text-center color-red`} >{__("#WAIT_NEXT_LOT#")}</h3>
                                                                : <h3 className={`py-5 text-center color-red`} >{__("#AUCTION_HAS_FINISHED#")}</h3>
                                                            )
                                                        }
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            ) :
                                <Center {...props} auction={state.auction} finished={state.finished} started={state.started} />
                        )}
                    <div className="auction-page-inner">
                        <div className="auction-works-list my-5">
                            <LotsList {...props} auction={state.auction} finished={state.finished} started={state.started} />
                        </div>
                        <div className="my-5">
                            <Bottom {...props} auction={state.auction} finished={state.finished} started={state.started} />
                        </div>
                    </div>
                    <div className="sticky-section">
                        <span>{state.auction.status === 'finished' ? __('ARCHIVE_OF_AUCTIONS') : state.auction.title}</span>
                    </div>
                </div>
            </div>
        </section>
    ) : (
            ``
        );
}
