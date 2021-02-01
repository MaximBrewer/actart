import React, { useState, useEffect, useRef } from "react";
import { FavoriteBig } from "../../../../icons/icons";
import __ from "../../../../utils/trans";
import { useAuth } from "../../../../context/auth";

import Countdown, { zeroPad } from "react-countdown";

export default function Right(props) {
    const { req, item } = props;
    const { initializing, currentUser, setCurrentUser } = useAuth();
    const countdownRef = useRef(null);
    const countdownElem = useRef(null);

    const [state, setState] = useState({
        countdown: "",
        item: item
    });

    const [hideOffer, setHideOffer] = useState(false);
    const declOfNum = (number, titles) => {
        let cases = [2, 0, 1, 1, 1, 2];
        return titles[
            number % 100 > 4 && number % 100 < 20
                ? 2
                : cases[number % 10 < 5 ? number % 10 : 5]
        ];
    };

    const renderer = ({ days, hours, minutes, seconds, completed }) => {
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

    const createBet = event => {
        setState(prevState => {
            if (state.item.id == event.detail.bet.lot_id) {
                if (countdownRef && countdownRef.current)
                    countdownRef.current.stop();
                if (countdownElem && countdownElem.current)
                    countdownElem.current.style.display = "none";
                return {
                    date: Date.now() + 1000 * window.App.timer,
                    countdowned: true
                };
            } else return prevState;
        });
    };

    const updateCountdown = event => {
        setState(prevState => {
            if (state.item.id == event.detail.id) {
                return {
                    ...prevState,
                    countdowning: false,
                    countdown: ""
                };
            }
        });
        setState(prevState => {
            if (state.item.id == event.detail.id) {
                state.item.countdown = event.detail.countdown;
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
                } else {
                    return {
                        ...prevState,
                        countdown: ""
                    };
                }
            } else return prevState;
        });
    };

    useEffect(() => {
        updateCountdown({
            detail: {
                id: state.item.id,
                countdown: state.item.countdown
            }
        });
        setHideOffer(
            state.item.countdown &&
                new Date(state.item.countdown).getTime() +
                    1000 * window.App.timer <
                    new Date().getTime()
        );
        window.addEventListener("create-bet", createBet);
        window.addEventListener("update-countdown", updateCountdown);
        return () => {
            window.removeEventListener("update-countdown", updateCountdown);
            window.removeEventListener("create-bet", createBet);
        };
    }, []);

    const getStep = () => {
        for (let step of window.App.steps) {
            if (step.to > state.item.price || !step.to) return step.step * 1;
        }
    };

    const handleOnComplete = () => {
        setHideOffer(true);
    };

    return (
        <div className="lot-carousel-right">
            <div className="pb-3 d-flex justify-content-between">
                <div className="lot-number">
                    {__("LOT_TEXT_LOT_ID")} {state.item.sort}
                </div>
                {/* <FavoriteBig state.item={state.item} req={req} /> */}
            </div>
            <div className="lot-author">
                <a className="author" href={state.item.author_url}>
                    {state.item.author}
                </a>
            </div>
            <div className="lot-title">{state.item.title}</div>
            <div className="matherial">
                {state.item.materials.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="styles">
                {state.item.styles.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="frames">
                {state.item.frames.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="techniques">
                {state.item.techniques.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="categories">
                {state.item.categories.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="size">
                {state.item.width} х {state.item.height} {__("MEASURE_CM")}
                {state.item.year
                    ? ` / ` + state.item.year + ` ` + __("SHORT_YEAR")
                    : ``}
            </div>
            <div className="start-price">
                <span>
                    {__("LOT_START_PRICE")}: ${state.item.startPrice}
                </span>
            </div>
            {currentUser != undefined ? (
                <div className="user-activity">
                    <div className="user-id">
                        {__("LOT_YOUR_ID")}: <span>#{currentUser.id}</span>
                    </div>
                    {state.item.bets.length ? (
                        <div className="last-price">
                            <div className="title">{__("LOT_LAST_PRICE")}</div>
                            <div className="info">
                                <div className="pb-1">${state.item.price}</div>
                                <div>
                                    {__("LOT_SEED")}:{" "}
                                    <span>#{state.item.bets[0].user_id}</span>
                                </div>
                            </div>
                        </div>
                    ) : (
                        ``
                    )}
                    {hideOffer ? (
                        ``
                    ) : (
                        <a
                            className="btn btn-danger"
                            href="#"
                            onClick={e => {
                                e.preventDefault();
                                offer(
                                    state.item.id,
                                    getStep() + state.item.price * 1
                                );
                            }}
                        >
                            <div className="pb-1">{__("LOT_BUTTON_OFFER")}</div>
                            <div>${state.item.price * 1 + getStep()}</div>
                        </a>
                    )}

                    {state.countdown}
                    {!state.item.bets.length && state.item.lastchance ? (
                        <h4 className="color-red text-center blink">
                            {__("LAST_CHANCE_TO_USER")}
                        </h4>
                    ) : (
                        ``
                    )}
                </div>
            ) : (
                ``
            )}
        </div>
    );
}
