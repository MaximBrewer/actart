import React, { useState, useEffect } from "react";
import Right from "./blocks/Right";
import __ from "../../../utils/trans";
import Parser from "html-react-parser";

export default function Center(props) {
    const [state, setState] = useState({
        auction: props.auction,
        current: props.auction.current,
        finished: false,
        translation: window.App.translation
    });


    const updateLotLastChance = event => {
        console.log(event)
        setState(prevState => {
            let auction = prevState.auction,
                current = prevState.current,
                lots = [],
                update = false,
                finished = prevState.finished;
            for (let i in auction.lots) {
                let lot = auction.lots[i];
                if (lot.id == event.detail.id) {
                    lot.lastchance = event.detail.lastchance;
                    update = true;
                }
                lots.push(lot);
            }
            auction.lots = lots;
            if (update)
                return {
                    ...prevState,
                    auction: auction,
                    current: current,
                    finished: finished
                };
            return prevState;
        });
    };

    const updateLotStatus = event => {
        setState(prevState => {
            let auction = prevState.auction,
                current = prevState.current,
                lots = [],
                update = false,
                finished = prevState.finished;
            for (let i in auction.lots) {
                let lot = auction.lots[i];
                if (lot.id == event.detail.id) {
                    lot.status = event.detail.status;
                    if (event.detail.status == "in_auction") current = lot;
                    update = true;
                }
                lots.push(lot);
            }
            auction.lots = lots;
            if (update)
                return {
                    ...prevState,
                    auction: auction,
                    current: current,
                    finished: finished
                };
            return prevState;
        });
    };

    const createBet = event => {
        setState(prevState => {
            let auction = prevState.auction,
                lots = [],
                update = false,
                current = prevState.current;
            for (let i in auction.lots) {
                let lot = auction.lots[i],
                    bets = lot.bets;
                if (lot.id == event.detail.bet.lot_id) {
                    bets.unshift(event.detail.bet);
                    lot.price = event.detail.bet.bet;
                    if (lot.id == current.id) current = lot;
                    update = true;
                }
                lots.push(lot);
            }
            auction.lots = lots;
            if (update) {
                return {
                    ...prevState,
                    auction: auction,
                    current: current
                };
            }
            return prevState;
        });
    };

    const updateTranslation = event => {
        setState(prevState => ({
            ...prevState,
            translation: event.detail.translation
        }));
    };

    useEffect(() => {
        window.addEventListener("update-translation", updateTranslation);
        window.addEventListener("update-lot-status", updateLotStatus);
        window.addEventListener("update-lot-lastchance", updateLotLastChance);
        window.addEventListener("create-bet", createBet);
        return () => {
            window.removeEventListener("update-translation", updateTranslation);
            window.removeEventListener("update-lot-status", updateLotStatus);
            window.removeEventListener("update-lot-lastchance", updateLotLastChance);
            window.removeEventListener("create-bet", createBet);
        };
    }, []);

    return (
        <div className="auction-info">
            <div className="container">
                <div className="lot-carousel">
                    <div className="row">
                        <div className="col-xl-40 col-xxl-38">
                            <div className="left-side">
                                <div>
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
                                    <div
                                        className={`current`}
                                        style={{
                                            display: "flex",
                                            justifyContent: "flex-end"
                                        }}
                                    >
                                        {state.current ? (
                                            <div
                                                className="py-2"
                                                style={{
                                                    maxWidth: "20rem",
                                                    width: "100%"
                                                }}
                                            >
                                                <div
                                                    className="image"
                                                    alt={
                                                        state.current.thumbnail
                                                    }
                                                    style={{
                                                        display: "block",
                                                        position: "relative",
                                                        backgroundSize:
                                                            "contain",
                                                        backgroundRepeat:
                                                            "no-repeat",
                                                        backgroundPosition:
                                                            "right bottom",
                                                        paddingTop: "65%",
                                                        backgroundColor:
                                                            "#ECEDED",
                                                        backgroundImage:
                                                            'url("' +
                                                            state.current
                                                                .thumbnail +
                                                            '")'
                                                    }}
                                                ></div>
                                            </div>
                                        ) : (
                                            ``
                                        )}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-xl-20 col-xxl-22">
                            <div className="right-side">
                                {state.current ? (
                                    <Right item={state.current} {...props} />
                                ) : (
                                    <h3
                                        className={`py-5 text-center color-red`}
                                    >
                                        {!state.finished
                                            ? __("AUCTION_WILL_START_SOON")
                                            : __("AUCTION_HAS_FINISHED")}
                                    </h3>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
