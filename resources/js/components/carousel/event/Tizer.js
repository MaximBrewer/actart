import React from "react";
import { Link } from "react-router-dom";

export default function Tizer(props) {
    const { data, item } = props;
    const url = "/events/" + item.id;

    return (
        <div className="event-slide">
            <div className="slide-inner">
                <Link
                    to={url}
                    className={`image mb-4`}
                    style={{
                        backgroundImage: `url(${encodeURI(item.preview)})`
                    }}
                ></Link>
                <Link className="title" to={url}>
                    {item.title}
                </Link>
                <div className="subtitle">{item.excerpt}</div>
                <div className="date">{item.dates}</div>
                <div className="exhibit">{item.space.title}</div>
                <div className="address">{item.space.address}</div>
            </div>
        </div>
    );
}
