import React, { useState, useEffect } from "react";
import { Favorite, Hammer } from "../../../icons/icons";
import __ from '../../../utils/trans';
import { useAuth } from '../../../context/auth';
import {
    Link
} from "react-router-dom";

export default function Tizer(props) {
    const [state, setState] = useState({
        item: props.item,
    });
    useEffect(() => {
        window.addEventListener("update-lot", updateLot);
        return () => window.removeEventListener("update-lot", updateLot)
    }, []);
    const updateLot = event => {
        if (event.detail.lot.id == state.item.id) {
            setState(prevState => ({
                ...prevState,
                item: event.detail.lot
            }))
        }
    };
    const url =
        state.item.status == "gallery"
            ? "/gallery/lot/" + state.item.id
            : "/auctions/" + state.item.auction_id + "/lot/" + state.item.id;

    return (
        <div className={`gallery-item`}>
            <div className="image-holder">
                <Link
                    className={`image`}
                    style={{
                        backgroundImage: "url(" + state.item.thumbnail + ")",
                        paddingTop:
                            (state.item.pxheight / state.item.pxwidth) * 100 + "%"
                    }}
                    to={url}
                >
                    <Favorite item={state.item} {...props} />
                </Link>
            </div>
            <Link className={`title`} to={url}>
                {state.item.title}
            </Link>
            <div className="d-flex justify-content-between">
                <Link className="author" to={state.item.author_url}>
                    {state.item.author}
                </Link>
                <div className="price">
                    <Hammer />
                    <span>
                        ${state.item.bets.length ? state.item.bets[0].bet : state.item.price}
                    </span>
                </div>
            </div>
            <div className="matherial">
                {state.item.materials.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="size">
                {state.item.width} х {state.item.height}
                {__("MEASURE_CM")}
            </div>
            {props.data.showStatus ? (
                <Link className={state.item.status + ` status`} to={url}>
                    {__("#status-" + state.item.status + "#")}
                </Link>
            ) : (
                    ``
                )}
        </div>
    );
}
