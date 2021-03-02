import React, { useState, useEffect } from "react";
import { Favorite, Hammer } from "../../../icons/icons";
import __ from "../../../utils/trans";
import { Link } from "react-router-dom";

export default function Tizer(props) {
    const [state, setState] = useState({
        item: props.item,
        url: ""
    });

    const updateLotStatus = event => {
        // setState(prevState => {
        //     for(let item of prevState.items)
        //     let item = { ...prevState.item };
        //     item.status = event.detail.status;
        //     return prevState;
        // });
    };

    const createBet = event => {
        setState(prevState => {
            let item = { ...prevState.item },
                update = false;
            if (item.id == event.detail.bet.lot_id) {
                item.bets.unshift(event.detail.bet);
                item.price = event.detail.bet.bet;
                update = true;
            }
            if (update)
                return {
                    ...prevState,
                    item: item
                };
            return prevState;
        });
    };

    useEffect(() => {
        window.addEventListener("update-lot-status", updateLotStatus);
        window.addEventListener("create-bet", createBet);
        switch (state.item.status) {
            case "gallery":
                setState(prevState => ({
                    ...prevState,
                    url: `/gallery/lot/${state.item.id}`
                }));
                break;
            case "gsold":
                setState(prevState => ({
                    ...prevState,
                    url: `/gallery/archive/lot/${state.item.id}`
                }));
                break;
            case "auction":
            case "sold":
                if (state.item.auction_id)
                    setState(prevState => ({
                        ...prevState,
                        url: `/auctions/${state.item.auction_id}/lot/${state.item.id}`
                    }));
                else
                    setState(prevState => ({
                        ...prevState,
                        url: false
                    }));
                break;
            default:
                setState(prevState => ({
                    ...prevState,
                    url: false
                }));
                break;
        }
        return () => {
            window.removeEventListener("update-lot-status", updateLotStatus);
            window.removeEventListener("create-bet", createBet);
        };
    }, []);

    return (
        <div className={`gallery-item`}>
            <div className="image-holder">
                {state.url ? (
                    <>
                        <Link
                            className={`image`}
                            style={{
                                backgroundImage: `url(${encodeURI(
                                    state.item.thumbnail
                                )})`,
                                paddingTop:
                                    (state.item.pxheight / state.item.pxwidth) *
                                        100 +
                                    "%"
                            }}
                            to={state.url}
                        >
                            {state.item.status == "gallery" ? (
                                <Favorite item={state.item} {...props} />
                            ) : (
                                ``
                            )}
                        </Link>
                        <Link className={`title`} to={state.url}>
                            {state.item.title}
                        </Link>
                    </>
                ) : (
                    <>
                        <div
                            className={`image`}
                            style={{
                                backgroundImage: `url(${encodeURI(
                                    state.item.thumbnail
                                )})`,
                                paddingTop:
                                    (state.item.pxheight / state.item.pxwidth) *
                                        100 +
                                    "%"
                            }}
                        >
                            {state.item.status == "gallery" ? (
                                <Favorite item={state.item} {...props} />
                            ) : (
                                ``
                            )}
                        </div>
                        <span className={`title`}>{state.item.title}</span>
                    </>
                )}
            </div>
            <div className="d-flex justify-content-between flex-wrap">
                <Link className="author" to={state.item.author_url}>
                    {state.item.author}
                </Link>
                <div className="price">
                    <Hammer />
                    <span>
                        $
                        {state.item.bets.length
                            ? state.item.bets[0].bet
                            : state.item.price}
                    </span>
                </div>
            </div>
            <div className="matherial">
                {state.item.materials.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="techniques">
                {state.item.techniques.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="size">
                {state.item.width} &times; {state.item.height}
                {__("MEASURE_CM")}
            </div>
            {props.data.showStatus ? (
                <Link className={state.item.status + ` status`} to={state.url}>
                    {__("#status-" + state.item.status + "#")}
                </Link>
            ) : (
                ``
            )}
        </div>
    );
}
