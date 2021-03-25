import React from "react";
import { FavoriteBig } from "../../../icons/icons";
import __ from "../../../utils/trans";
import { useAuth } from "../../../context/auth";

export default function Right(props) {
    const { req, item, auction } = props;
    const { currentUser } = useAuth();

    const offer = (id, price) => {
        req("/api/" + window.App.locale + "/offer/" + id + "/" + price, "PATCH")
            .then(() => null)
            .catch(err => console.log(err));
    };
    const blitz = id => {
        req("/api/" + window.App.locale + "/blitz/" + id, "PATCH")
            .then(() => { })
            .catch(err => console.log(err));
    };
    const getStep = () => {
        for(let step of window.App.steps){
            if(step.to > item.price || !step.to) return step.step * 1
        }
    }

    return (
        <div className="lot-carousel-right">
            <div className="pb-3 d-flex justify-content-between">
                <div className="lot-number">
                    {__("LOT_TEXT_LOT_ID")} {item.sort}
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
                {item.styles.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
                {item.frames.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
                {item.techniques.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
                {item.categories.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="size">
                {item.width} &times; {item.height} {__("MEASURE_CM")}
                {item.year ? ` / ` + item.year + ` ` + __("SHORT_YEAR") : ``}
            </div>
            <div className="start-price">
                <span>
                    {__("LOT_START_PRICE")}: ${item.startPrice}
                </span>
            </div>
            {currentUser != undefined && auction.status == "started" ? (
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
                    {item.status == "in_auction" ? (
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
