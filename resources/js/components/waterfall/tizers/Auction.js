import React from "react";
import { Link } from "react-router-dom";
import __ from '../../../utils/trans';

export default function Tizer(props) {
    const { data, item, toFavorite, favorites } = props;
    return (
        <div className={`auction-item`}>
            <Link
                className={`image`}
                style={{
                    backgroundImage: "url(" + item.thumbnail + ")",
                }}
                to={`/auctions/` + data.auction.id + `/lot/` + item.id}
            >
                <div
                    href="#"
                    onClick={e => toFavorite(item.id, e)}
                    className={
                        favorites && favorites.indexOf(item.id) > -1
                            ? `favorite-link active`
                            : `favorite-link`
                    }
                    style={{
                        position: "absolute",
                        top: ".5rem",
                        right: ".5rem"
                    }}
                >
                    <svg
                        width="22"
                        height="22"
                        viewBox="0 0 22 22"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <circle cx="11" cy="11" r="10.5" />
                        <path d="M11.007 7C4.16959 7 2.08566 11.8388 2 12.0451L4.14935 13.02C4.1914 12.9242 4.88293 11.3952 6.85005 10.3715C6.75156 10.7502 6.70181 11.1409 6.70209 11.5333C6.70127 12.1194 6.8112 12.7 7.02559 13.2418C7.23998 13.7836 7.55463 14.2759 7.95155 14.6908C8.34846 15.1056 8.81987 15.4348 9.3388 15.6594C9.85773 15.884 10.414 15.9998 10.9759 16H11.0335C12.1662 16.0009 13.2528 15.5326 14.0548 14.6981C14.8567 13.8637 15.3083 12.7312 15.3104 11.5496C15.3113 11.1658 15.2647 10.7835 15.1718 10.4122C17.1077 11.4472 17.8288 12.955 17.8709 13.046L20 12.0159C19.9112 11.8112 17.6933 7 11.007 7ZM13.4694 13.5969H10.75V10.7599H13.4694V13.5969Z" />
                    </svg>
                </div>
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
            <a className="author" href={item.author_url}>
                {item.author}
            </a>
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
        </div>
    );
}
