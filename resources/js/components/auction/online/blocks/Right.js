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
        countdowned: false,
        date: 0
    });

    const renderer = ({ days, hours, minutes, seconds, completed }) => {
        return (
            <div className="countdown-lot-wrapper" ref={countdownElem}>
                {zeroPad(hours)}:{zeroPad(minutes)}:{zeroPad(seconds)}
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
            if (item.id == event.detail.bet.lot_id) {
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

    const setStartCountdown = event => {
        setState(prevState => {
            if (item.id == event.detail.id) {
                if (countdownRef && countdownRef.current)
                    countdownRef.current.start();
                if (countdownElem && countdownElem.current)
                    countdownElem.current.style.display = "block";
                return {
                    date: Date.now() + 1000 * window.App.timer,
                    countdowned: true
                };
            } else return prevState;
        });
    };

    useEffect(() => {
        window.addEventListener("create-bet", createBet);
        window.addEventListener("start-countdown", setStartCountdown);
        return () => {
            window.removeEventListener("start-countdown", setStartCountdown);
            window.removeEventListener("create-bet", createBet);
        };
    }, []);

    const getStep = () => {
        for (let step of window.App.steps) {
            if (step.to > item.price || !step.to) return step.step * 1;
        }
    };

    const handleOnComplete = () => {
        if (countdownElem && countdownElem.current)
            countdownElem.current.style.display = "none";
    };

    return (
        <div className="lot-carousel-right">
            <div className="pb-3 d-flex justify-content-between">
                <div className="lot-number">
                    {__("LOT_TEXT_LOT_ID")} {item.sort}
                </div>
                {/* <FavoriteBig item={item} req={req} /> */}
            </div>
            <div className="lot-author">
                <a className="author" href={item.author_url}>
                    {item.author}
                </a>
            </div>
            <div className="lot-title">{item.title}</div>
            <div className="matherial">
                {item.materials.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="styles">
                {item.styles.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="frames">
                {item.frames.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="techniques">
                {item.techniques.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="categories">
                {item.categories.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="size">
                {item.width} х {item.height} {__("MEASURE_CM")}
                {item.year ? ` / ` + item.year + ` ` + __("SHORT_YEAR") : ``}
            </div>
            <div className="start-price">
                <span>
                    {__("LOT_START_PRICE")}: ${item.startPrice}
                </span>
            </div>
            {currentUser != undefined ? (
                <div className="user-activity">
                    <div className="user-id">
                        {__("LOT_YOUR_ID")}: <span>#{currentUser.id}</span>
                    </div>
                    {item.bets.length ? (
                        <div className="last-price">
                            <div className="title">{__("LOT_LAST_PRICE")}</div>
                            <div className="info">
                                <div className="pb-1">${item.price}</div>
                                <div>
                                    {__("LOT_SEED")}:{" "}
                                    <span>#{item.bets[0].user_id}</span>
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
                            offer(item.id, getStep() + item.price * 1);
                        }}
                    >
                        <div className="pb-1">{__("LOT_BUTTON_OFFER")}</div>
                        <div>${item.price * 1 + getStep()}</div>
                    </a>
                    <Countdown
                        date={Date.now() + 1000 * window.App.timer}
                        ref={countdownRef}
                        autoStart={false}
                        renderer={renderer}
                        onComplete={handleOnComplete}
                    />
                    {!item.bets.length && item.lastchance ? (
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
