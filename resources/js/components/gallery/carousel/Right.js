import React, { useState, useEffect } from "react";
import { FavoriteBig } from "../../../icons/icons";
import __ from '../../../utils/trans';
import { useAuth } from '../../../context/auth';

export default function Right(props) {
    const { req } = props;
    const { initializing, currentUser, setCurrentUser } = useAuth();


    const [state, setState] = useState({
        item: props.item
    });
    useEffect(() => {
        window.addEventListener("lot", updateLot);
        return () => window.removeEventListener("lot", updateLot)
    }, []);

    const updateLot = event => {
        if (event.detail.lot.id == state.item.id) {
            setState(prevState => ({
                ...prevState,
                item: event.detail.lot
            }))
        }
    };

    const offer = (id, price) => {
        req("/api/offer/" + id + "/" + price, "PATCH")
            .then(() => null)
            .catch((err) => console.log(err));
    };
    const blitz = (id) => {
        req("/api/blitz/" + id)
            .then(() => null)
            .catch((err) => console.log(err));
    };

    return (
        <div className="lot-carousel-right">
            <div className="pb-3 d-flex justify-content-between">
                <div className="lot-number">
                    {__("LOT_TEXT_LOT_ID")} {state.item.id}
                </div>
                <FavoriteBig item={state.item} req={req} />
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
                {state.item.width} х {state.item.height} {__("MEASURE_CM")}{state.item.year ? ` / ` + state.item.year + ` ` + __("SHORT_YEAR") : ``}
                
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
                    <a
                        className="btn btn-danger"
                        href="#"
                        onClick={e => {
                            e.preventDefault();
                            offer(state.item.id, 100 + state.item.price * 1);
                        }}
                    >
                        <div className="pb-1">{__("LOT_BUTTON_OFFER")}</div>
                        <div>${state.item.price * 1 + 100}</div>
                    </a>
                    {state.item.price * 1 < state.item.blitz * 1 ? (
                        <div className="blitz-price">
                            <a
                                className="pb-1"
                                href="#"
                                onClick={e => {
                                    e.preventDefault();
                                    blitz(state.item.id);
                                }}
                            >
                                <div>{__("LOT_BUTTON_BLITZ")}</div>
                            </a>
                            <div>${state.item.blitz}</div>
                        </div>
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
