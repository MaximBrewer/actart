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
import Lightbox from "react-image-lightbox";
import YouTube from "react-youtube";
import Countdown, { zeroPad } from "react-countdown";
import { useAuth } from "../../context/auth";

export default function Auction(props) {
    const { req } = props;
    const { currentUser } = useAuth();
    const { id } = useParams();

    const declOfNum = (number, titles) => {
        let cases = [2, 0, 1, 1, 1, 2];
        return titles[
            number % 100 > 4 && number % 100 < 20
                ? 2
                : cases[number % 10 < 5 ? number % 10 : 5]
        ];
    };

    useEffect(() => {
        if (!currentUser) history.push("/#login");
    }, [currentUser]);

    const hideOffer = false;

    const renderer = ({ seconds }) => {
        return (
            <div
                className="countdown-lot-wrapper h5 color-red"
                style={{ display: seconds > 0 ? "block" : "none" }}
            >
                {window.App.locale == "ru"
                    ? `Осталось ${zeroPad(seconds)} ${declOfNum(seconds, [
                          "секунда",
                          "секунды",
                          "секунд"
                      ])}`
                    : `${zeroPad(seconds)} ${declOfNum(seconds, [
                          "second",
                          "seconds",
                          "seconds"
                      ])} left`}
            </div>
        );
    };

    const offer = (id, price) => {
        req("/api/" + window.App.locale + "/offer/" + id + "/" + price, "PATCH")
            .then(() => null)
            .catch(err => console.log(err));
    };

    const [state, setState] = useState({
        auction: null,
        finished: false,
        countdown: "",
        started: false,
        translation: window.App.translation,
        lbOpen: false
    });

    const [muted, setMuted] = useState(true);

    const updateTranslation = event => {
        setState(prevState => ({
            ...prevState,
            translation: event.detail.translation
        }));
    };

    const [player, setPlayer] = useState(null);

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
                    countdown: "",
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
                    countdown: "",
                    auction: auction
                };
            }
            return prevState;
        });
    };

    const updateCountdown = event => {
        setState(prevState => {
            let auction = prevState.auction;
            if (auction.current.id == event.detail.id) {
                return {
                    ...prevState,
                    countdown: ""
                };
            }
        });
        setState(prevState => {
            let auction = prevState.auction;
            if (auction.current.id == event.detail.id) {
                auction.current.countdown = event.detail.countdown;
                if (
                    new Date().getTime() - 1000 * window.App.timer <
                    new Date(event.detail.countdown).getTime()
                ) {
                    return {
                        ...prevState,
                        countdown: (
                            <Countdown
                                date={
                                    new Date(event.detail.countdown).getTime() +
                                    1000 * window.App.timer
                                }
                                renderer={renderer}
                                onComplete={handleOnComplete}
                            />
                        )
                    };
                }
            }
            return prevState;
        });
    };

    const getStep = () => {
        for (let step of window.App.steps) {
            if (step.to > state.auction.current.price || !step.to)
                return step.step * 1;
        }
    };

    const handleOnComplete = () => {};

    const { url } = useRouteMatch();
    const { pathname } = useLocation();

    useEffect(() => {}, [pathname]);

    const lotId =
        (pathname == url ? false : pathname.replace(url + "/lot/", "")) * 1;

    useEffect(() => {
        window.addEventListener("update-countdown", updateCountdown);
        window.addEventListener("update-auction-status", updateAuctionStatus);
        window.addEventListener("update-lot-status", updateLotStatus);
        window.addEventListener("update-lot-lastchance", updateLotLastChance);
        window.addEventListener("create-bet", createBet);
        window.addEventListener("update-translation", updateTranslation);
        axios
            .get("/api/" + window.App.locale + "/auctions/" + id)
            .then(res => {
                let countdown =
                    res.data &&
                    res.data.auction &&
                    res.data.auction.current &&
                    res.data.auction.current.countdown &&
                    new Date().getTime() - 1000 * window.App.timer <
                        new Date(
                            res.data.auction.current.countdown
                        ).getTime() ? (
                        <Countdown
                            date={
                                new Date(
                                    res.data.auction.current.countdown
                                ).getTime() +
                                1000 * window.App.timer
                            }
                            renderer={renderer}
                            onComplete={handleOnComplete}
                        />
                    ) : (
                        ""
                    );

                setState(prevState => {
                    return {
                        ...prevState,
                        auction: res.data.auction,
                        countdown: countdown,
                        started: res.data.auction.current
                            ? true
                            : prevState.started
                    };
                });
            })
            .catch(err => {
                console.log(err);
            });
        return () => {
            window.removeEventListener("update-countdown", updateCountdown);
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

    const opts = {
        width: "360px",
        height: "240px",
        videoId: state.translation,
        playerVars: {
            autoplay: 1,
            playsinline: 1,
            controls: 1,
            modestbranding: 1,
            showinfo: 0,
            fs: 0,
            iv_load_policy: 3
        }
    };

    const onPlayerReady = event => {
        event.target.mute();
        event.target.playVideo();
        setPlayer(event.target);
    };

    return state.auction ? (
        <section className="auction-page-wrapper">
            <div className={`status-` + state.auction.status}>
                <Top
                    {...props}
                    auction={state.auction}
                    finished={state.finished}
                    started={state.started}
                />
                <div className="sticky-wrapper">
                    {lotId ? (
                        <div className="auction-info">
                            <div className="container">
                                <Carousel
                                    {...props}
                                    auction={state.auction}
                                    finished={state.finished}
                                    started={state.started}
                                />
                            </div>
                        </div>
                    ) : state.auction.status == "started" ? (
                        <div className="auction-info">
                            <div className="container">
                                <div className="lot-carousel">
                                    <div className="row">
                                        <div className="col-xl-40 col-xxl-38">
                                            <div className="left-side">
                                                <div>
                                                    {state.auction.current ? (
                                                        <div
                                                            style={{
                                                                width: "100%"
                                                            }}
                                                        >
                                                            <div
                                                                onClick={() =>
                                                                    setState(
                                                                        prevState => ({
                                                                            ...prevState,
                                                                            lbOpen: true
                                                                        })
                                                                    )
                                                                }
                                                                className="image"
                                                                alt={
                                                                    state
                                                                        .auction
                                                                        .current
                                                                        .thumbnail
                                                                }
                                                                style={{
                                                                    cursor:
                                                                        "pointer",
                                                                    display:
                                                                        "block",
                                                                    position:
                                                                        "relative",
                                                                    backgroundSize:
                                                                        "contain",
                                                                    backgroundRepeat:
                                                                        "no-repeat",
                                                                    backgroundPosition:
                                                                        "center",
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
                                                            {state.lbOpen && (
                                                                <Lightbox
                                                                    mainSrc={
                                                                        state
                                                                            .auction
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
                                                    ) : (
                                                        ``
                                                    )}
                                                    <div
                                                        className={`current d-flex justify-content-between py-2`}
                                                    >
                                                        <div className="h2 color-red d-none d-sm-block">
                                                            {state.auction
                                                                .current
                                                                ? __(
                                                                      "LOT_TEXT_LOT_ID"
                                                                  ) +
                                                                  ` ` +
                                                                  state.auction
                                                                      .current
                                                                      .sort
                                                                : ``}
                                                        </div>
                                                        <div
                                                            style={{
                                                                width: "100%",
                                                                maxWidth:
                                                                    "340px"
                                                            }}
                                                        >
                                                            <div
                                                                style={{
                                                                    paddingTop:
                                                                        "58.82%",
                                                                    height: 0,
                                                                    position:
                                                                        "relative"
                                                                }}
                                                                className={`translation-wrapper`}
                                                            >
                                                                <YouTube
                                                                    id="translationEl"
                                                                    videoId={
                                                                        state.translation
                                                                    }
                                                                    opts={opts}
                                                                    onReady={
                                                                        onPlayerReady
                                                                    }
                                                                />
                                                            </div>
                                                            <small className="color-red">
                                                                {__(
                                                                    "#TRANSLATION_HELP#"
                                                                )}
                                                            </small>
                                                            <button
                                                                type="button"
                                                                className="d-block btn-default btn btn-sm my-1"
                                                                onClick={() =>
                                                                    setMuted(
                                                                        prevState => {
                                                                            player &&
                                                                                (prevState
                                                                                    ? player.unMute()
                                                                                    : player.mute());
                                                                            return !prevState;
                                                                        }
                                                                    )
                                                                }
                                                            >
                                                                {muted
                                                                    ? `вкл ЗВУК`
                                                                    : `выкл ЗВУК`}
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="col-xl-20 col-xxl-22">
                                            <div className="right-side">
                                                {state.auction.current ? (
                                                    <div className="lot-carousel-right">
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
                                                            <a
                                                                className="author"
                                                                href={
                                                                    state
                                                                        .auction
                                                                        .current
                                                                        .author_url
                                                                }
                                                            >
                                                                {
                                                                    state
                                                                        .auction
                                                                        .current
                                                                        .author
                                                                }
                                                            </a>
                                                        </div>
                                                        <div className="lot-title">
                                                            {
                                                                state.auction
                                                                    .current
                                                                    .title
                                                            }
                                                        </div>
                                                        <div className="matherial">
                                                            {state.auction.current.materials.map(
                                                                (m, mi) => (
                                                                    <span
                                                                        key={mi}
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
                                                                (m, mi) => (
                                                                    <span
                                                                        key={mi}
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
                                                                (m, mi) => (
                                                                    <span
                                                                        key={mi}
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
                                                                (m, mi) => (
                                                                    <span
                                                                        key={mi}
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
                                                                (m, mi) => (
                                                                    <span
                                                                        key={mi}
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
                                                                state.auction
                                                                    .current
                                                                    .width
                                                            }{" "}
                                                            х{" "}
                                                            {
                                                                state.auction
                                                                    .current
                                                                    .height
                                                            }{" "}
                                                            {__("MEASURE_CM")}
                                                            {state.auction
                                                                .current.year
                                                                ? ` / ` +
                                                                  state.auction
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
                                                        {currentUser !=
                                                        undefined ? (
                                                            <div className="user-activity">
                                                                <div className="user-id">
                                                                    {__(
                                                                        "LOT_YOUR_ID"
                                                                    )}
                                                                    :{" "}
                                                                    <span>
                                                                        #
                                                                        {
                                                                            currentUser.id
                                                                        }
                                                                    </span>
                                                                </div>
                                                                {state.auction
                                                                    .current
                                                                    .bets
                                                                    .length ? (
                                                                    <div className="last-price">
                                                                        <div className="title">
                                                                            {__(
                                                                                "LOT_LAST_PRICE"
                                                                            )}
                                                                        </div>
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
                                                                {state.auction
                                                                    .current
                                                                    .countdown &&
                                                                new Date(
                                                                    state.auction.current.countdown
                                                                ).getTime() +
                                                                    1000 *
                                                                        window
                                                                            .App
                                                                            .timer <
                                                                    new Date().getTime() ? (
                                                                    ``
                                                                ) : (
                                                                    <a
                                                                        className="btn btn-danger"
                                                                        href="#"
                                                                        onClick={e => {
                                                                            e.preventDefault();
                                                                            offer(
                                                                                state
                                                                                    .auction
                                                                                    .current
                                                                                    .id,
                                                                                getStep() +
                                                                                    state
                                                                                        .auction
                                                                                        .current
                                                                                        .price *
                                                                                        1
                                                                            );
                                                                        }}
                                                                    >
                                                                        <div className="pb-1">
                                                                            {__(
                                                                                "LOT_BUTTON_OFFER"
                                                                            )}
                                                                        </div>
                                                                        <div>
                                                                            $
                                                                            {state
                                                                                .auction
                                                                                .current
                                                                                .price *
                                                                                1 +
                                                                                getStep()}
                                                                        </div>
                                                                    </a>
                                                                )}

                                                                {
                                                                    state.countdown
                                                                }
                                                                {!state.auction
                                                                    .current
                                                                    .bets
                                                                    .length &&
                                                                state.auction
                                                                    .current
                                                                    .lastchance ? (
                                                                    <h4 className="color-red text-center blink">
                                                                        {__(
                                                                            "LAST_CHANCE_TO_USER"
                                                                        )}
                                                                    </h4>
                                                                ) : (
                                                                    ``
                                                                )}
                                                            </div>
                                                        ) : (
                                                            ``
                                                        )}
                                                    </div>
                                                ) : !state.started ? (
                                                    <h3
                                                        className={`py-5 text-center color-red`}
                                                    >
                                                        {__(
                                                            "#AUCTION_WILL_START_SOON#"
                                                        )}
                                                    </h3>
                                                ) : !state.finished ? (
                                                    <h3
                                                        className={`py-5 text-center color-red`}
                                                    >
                                                        {__("#WAIT_NEXT_LOT#")}
                                                    </h3>
                                                ) : (
                                                    <h3
                                                        className={`py-5 text-center color-red`}
                                                    >
                                                        {__(
                                                            "#AUCTION_HAS_FINISHED#"
                                                        )}
                                                    </h3>
                                                )}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    ) : (
                        <Center
                            {...props}
                            auction={state.auction}
                            finished={state.finished}
                            started={state.started}
                        />
                    )}
                    <div className="auction-page-inner">
                        <div className="auction-works-list my-5">
                            <LotsList
                                {...props}
                                auction={state.auction}
                                finished={state.finished}
                                started={state.started}
                            />
                        </div>
                        <div className="my-5">
                            <Bottom
                                {...props}
                                auction={state.auction}
                                finished={state.finished}
                                started={state.started}
                            />
                        </div>
                    </div>
                    <div className="sticky-section">
                        <span>
                            {state.auction.status === "finished"
                                ? __("ARCHIVE_OF_AUCTIONS")
                                : state.auction.title}
                        </span>
                    </div>
                </div>
            </div>
        </section>
    ) : (
        ``
    );
}
