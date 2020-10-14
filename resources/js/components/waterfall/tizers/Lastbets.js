import React from "react";
import { Link } from "react-router-dom";
import { Favorite, Hammer } from "../../../icons/icons";
import __ from '../../../utils/trans';

export default function Tizer(props) {
    const { data, item} = props;
    const url =
        item.status == "gallery"
            ? "/gallery/lot/" + item.id
            : "/auctions/" + item.auction_id + "/lot/" + item.id;

    return (
        <div className={`gallery-item`}>
            <div className="image-holder">
                <Link
                    to={url}
                    className={`image`}
                    style={{
                        backgroundImage: "url(" + item.thumbnail + ")",
                        paddingTop: (item.pxheight / item.pxwidth) * 100 + "%"
                    }}
                >
                    <Favorite item={item} />
                </Link>
            </div>
            <Link className="title" to={url}>
                {item.title}
            </Link>
            <div className="d-flex justify-content-between">
                <Link className="author" to={item.author_url}>
                    {item.author}
                </Link>
                <div className="price">
                    <Hammer />
                    <span>
                        ${item.bets.length ? item.bets[0].bet : item.price}
                    </span>
                </div>
            </div>
            <div className="matherial">
                {item.materials.map((m, mi) => (
                    <span key={mi}>{m.title}</span>
                ))}
            </div>
            <div className="size">
                {item.width} х {item.height}
                {__("MEASURE_CM")}
            </div>
            <a className={item.status + ` status`} href="#">
                {__("#status-" + item.status + "#")}
            </a>
        </div>
    );
}
