import React from "react";
import { Link } from "react-router-dom";
import __ from '../../../utils/trans';

export default function Tizer(props) {
    const { data, item } = props;

    return (
        <div className="blog-item">
            <div className="category-date">
                <div className="category">{item.category}</div>
                <div className="date">{item.date}</div>
            </div>
            <Link
                className="image"
                style={{
                    backgroundImage: "url(" + item.thumbnail + ")"
                }}
                to={item.url}
            ></Link>
            <Link to={item.url}>
                <div className="title">{item.title}</div>
            </Link>
            <div className="excerpt">{item.excerpt}</div>
            <div className="link">
                <Link to={item.url}>{__("READ_MORE")}</Link>
            </div>
        </div>
    );
}
