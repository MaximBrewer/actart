import React, { useState, useEffect } from "react";
import { FavoriteBig } from "../../../../icons/icons";
import __ from "../../../../utils/trans";
import { useAuth } from "../../../../context/auth";

export default function Right(props) {
    const { req, item } = props;
    const { initializing, currentUser, setCurrentUser } = useAuth();

    const offer = (id, price) => {
        req("/api/" + window.App.locale + "/offer/" + id + "/" + price, "PATCH")
            .then(() => null)
            .catch(err => console.log(err));
    };
    const blitz = id => {
        req("/api/" + window.App.locale + "/blitz/" + id, "PATCH")
            .then(() => {})
            .catch(err => console.log(err));
    };

    return (
        <div className="lot-carousel-right">
            <div className="pb-3 d-flex justify-content-between">
                <div className="lot-number">
                    {__("LOT_TEXT_LOT_ID")} {item.id}
                </div>
                <FavoriteBig item={item} req={req} />
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
                            offer(item.id, 100 + item.price * 1);
                        }}
                    >
                        <div className="pb-1">{__("LOT_BUTTON_OFFER")}</div>
                        <div>${item.price * 1 + 100}</div>
                    </a>
                    <h4 className="color-red">{__("LAST_CHANCE_TO_USER")}</h4>
                </div>
            ) : (
                ``
            )}
        </div>
    );
}
