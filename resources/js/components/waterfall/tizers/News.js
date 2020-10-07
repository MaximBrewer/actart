import React from "react";
import { Link } from "react-router-dom";
import __ from '../../../utils/trans';

export default function Tizer(props) {
    const { data, item } = props;
    const url = "/events/" + item.id;

    return (
        <Link className="news-item" to={item.url}>
            <div className="category-date">
                <div className="category">{item.category}</div>
                <div className="date">{item.date}</div>
            </div>
            <div
                className="image"
                style={{
                    backgroundImage: "url(" + item.thumbnail + ")"
                }}
            ></div>
            <div className="title">{item.title}</div>
            <div className="announce">{item.excerpt}</div>
        </Link>
    );
}
