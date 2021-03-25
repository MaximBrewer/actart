import React, { useState, useEffect } from "react";
import { FavoriteBig } from "../../../icons/icons";
import __ from "../../../utils/trans";
import { useAuth } from "../../../context/auth";

export default function Right(props) {
    const { req, openModal } = props;
    const { currentUser } = useAuth();

    const [state, setState] = useState({
        item: props.item
    });

    return (
        <div className="lot-carousel-right">
            <div className="pb-3 d-flex justify-content-between">
                <div className="lot-number">
                    {__("LOT_TEXT_LOT_ID")} {state.item.id}
                </div>
                {/* <FavoriteBig item={state.item} req={req} /> */}
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
                {state.item.styles.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
                {state.item.frames.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
                {state.item.techniques.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
                {state.item.categories.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="size">
                {state.item.width} &times; {state.item.height} {__("MEASURE_CM")}
                {state.item.year
                    ? ` / ` + state.item.year + ` ` + __("SHORT_YEAR")
                    : ``}
            </div>
            <div className="start-price">
                <span>
                    {__("LOT_START_PRICE")}: ${state.item.startPrice}
                </span>
            </div>
            <div className="user-activity">
                {/* {currentUser != undefined ? (
                    <div className="user-id">
                        {__("LOT_YOUR_ID")}: <span>#{currentUser.id}</span>
                    </div>
                ) : (
                    ``
                )}
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
                )} */}
            </div>
        </div>
    );
}
