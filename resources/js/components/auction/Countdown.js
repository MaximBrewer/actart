import React, { useEffect, useState } from "react";
import CountdownMaster, {
    zeroPad
} from "react-countdown";
import __ from '../../utils/trans';

export default function Countdown(props) {


    const [state, setState] = useState({
        copletetionText: __('COUNTDOWN_AUCTION_STARTED')
    });

    const declOfNum = (number, titles) => {
        let cases = [2, 0, 1, 1, 1, 2];
        return titles[
            number % 100 > 4 && number % 100 < 20
                ? 2
                : cases[number % 10 < 5 ? number % 10 : 5]
        ];
    };

    const changeCopletetionText = (event) => {
        setState(prevState => ({
            ...prevState,
            copletetionText: event.detail.text
        }))
    }

    useEffect(() => {
        window.addEventListener("change-copletetion-text", changeCopletetionText);
        return () => {
            window.removeEventListener("change-copletetion-text", changeCopletetionText);
        };
    }, []);

    const Completionist = () => (
        <div className="banner-counter d-flex h3 h3 color-red">{state.copletetionText}</div>
    );

    const renderer = ({ days, hours, minutes, seconds, completed }) => {
        if (window.innerWidth < window.grid.sm) return "";

        if (completed) {
            return <Completionist />;
        } else {
            return (
                <div className="banner-counter-wrapper">
                    <p>{__("to start auction")}</p>
                    <div className="banner-counter d-flex">
                        <div className="days">
                            <div className="number h5">{zeroPad(days)}</div>
                            <small>
                                {declOfNum(days, [
                                    __("#COUNTDOWN_DAYS_1#"),
                                    __("#COUNTDOWN_DAYS_2#"),
                                    __("#COUNTDOWN_DAYS_3#")
                                ])}
                            </small>
                        </div>
                        <div className="separator h5"></div>
                        <div className="ours">
                            <div className="number h5">{zeroPad(hours)}</div>
                            <small>
                                {declOfNum(hours, [
                                    __("#COUNTDOWN_HOURS_1#"),
                                    __("#COUNTDOWN_HOURS_3#"),
                                    __("#COUNTDOWN_HOURS_3#")
                                ])}
                            </small>
                        </div>
                        <div className="separator h5">:</div>
                        <div className="minutes">
                            <div className="number h5">{zeroPad(minutes)}</div>
                            <small>
                                {declOfNum(minutes, [
                                    __("#COUNTDOWN_MINUTES_1#"),
                                    __("#COUNTDOWN_MINUTES_1#"),
                                    __("#COUNTDOWN_MINUTES_1#")
                                ])}
                            </small>
                        </div>
                        <div className="separator h5">:</div>
                        <div className="seconds">
                            <div className="number h5">{zeroPad(seconds)}</div>
                            <small>
                                {declOfNum(seconds, [
                                    __("#COUNTDOWN_SECONDS_1#"),
                                    __("#COUNTDOWN_SECONDS_1#"),
                                    __("#COUNTDOWN_SECONDS_1#")
                                ])}
                            </small>
                        </div>
                    </div>
                </div>
            );
        }
    };
    const data = { props };
    return <CountdownMaster date={props.date} renderer={renderer} />;
}
