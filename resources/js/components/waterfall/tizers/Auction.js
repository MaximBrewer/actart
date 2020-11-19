import React from "react";
import { Link } from "react-router-dom";
import __ from '../../../utils/trans';
import { Favorite } from "../../../icons/icons";

export default function Tizer(props) {
    const { data, item, req } = props;
    return (
        <div className={`auction-item`}>
            {data.auction.status == 'started' ?
                <React.Fragment>
                    <Link
                        className={`image`}
                        style={{
                            backgroundImage: "url(" + item.thumbnail + ")",
                        }}
                        to={`/auctions/` + data.auction.id + `/lot/` + item.id}
                    >
                        {data.auction.status != 'archive' ? <Favorite item={item} req={req} /> : ``}
                    </Link>
                    <Link
                        className="number"
                        to={`/auctions/` + data.auction.id + `/lot/` + item.id}
                    >
                        {__("Lot") + ` ` + item.sort}
                    </Link>
                    <Link
                        className="title"
                        to={`/auctions/` + data.auction.id + `/lot/` + item.id}
                    >
                        {item.title ? item.title : __("No name")}
                    </Link>
                    <Link className="author" to={item.author_url}>
                        {item.author}
                    </Link>
                    <div className="d-flex matherial-size">
                        <div className="matherial d-flex">
                            {item.materials.map((m, mi) => (
                                <span key={mi} className="m-span">
                                    {m.title}
                                </span>
                            ))}
                        </div>
                        <div className="size">
                            {item.width}х{item.height}&nbsp;{__("см")}
                        </div>
                    </div>
                    <div className="price">
                        {__("Start price")} <span>${item.price}</span>
                    </div>
                </React.Fragment>
                :
                <React.Fragment>
                    <Link
                        className={`image`}
                        style={{
                            backgroundImage: "url(" + item.thumbnail + ")",
                        }}
                        to={`/auctions/` + data.auction.id + `/lot/` + item.id}
                    >
                        {data.auction.status != 'archive' ? <Favorite item={item} req={req} /> : ``}
                    </Link>
                    <Link
                        className="number"
                        to={`/auctions/` + data.auction.id + `/lot/` + item.id}
                    >
                        {__("Lot") + ` ` + item.sort}
                    </Link>
                    <Link
                        className="title"
                        to={`/auctions/` + data.auction.id + `/lot/` + item.id}
                    >
                        {item.title ? item.title : __("No name")}
                    </Link>
                    <Link className="author" to={item.author_url}>
                        {item.author}
                    </Link>
                    <div className="d-flex matherial-size">
                        <div className="matherial d-flex">
                            {item.materials.map((m, mi) => (
                                <span key={mi} className="m-span">
                                    {m.title}
                                </span>
                            ))}
                        </div>
                        <div className="size">
                            {item.width}х{item.height}&nbsp;{__("см")}
                        </div>
                    </div>
                    <div className="price">
                        {__("Start price")} <span>${item.price}</span>
                    </div>
                </React.Fragment>
            }
        </div>
    );
}
