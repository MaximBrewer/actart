import React from "react";
import { Link } from "react-router-dom";

export default function Tizer(props) {
    const { data, item } = props;
    const url = "/news/" + item.slug;

    return (
        <Link className="post-slide" to={url}>
            <div className="slide-inner">
                <div className="d-flex justify-content-between">
                    <div className="category">{item.category}</div>
                    <div className="date">{item.date}</div>
                </div>
                <div
                    className="image mb-4"
                    style={{
                        backgroundImage: `url(${encodeURI(item.thumbnail)})`
                    }}
                ></div>
                <div className="title">{item.title}</div>
                <div className="announce">{item.excerpt}</div>
            </div>
        </Link>
    );
}
