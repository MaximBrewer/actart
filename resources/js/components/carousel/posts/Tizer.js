import React from "react";

export default function Tizer(props) {
    const { data, item } = props;
    const url = "/news/" + item.slug;

    return (
        <a className="post-slide" href={url}>
            <div className="slide-inner">
                <div className="d-flex justify-content-between">
                    <div className="category">{item.category}</div>
                    <div className="date">{item.date}</div>
                </div>
                <div
                    className="image mb-4"
                    style={{
                        backgroundImage: 'url("' + item.thumbnail + '")'
                    }}
                ></div>
                <div className="title">{item.title}</div>
                <div className="announce">{item.excerpt}</div>
            </div>
        </a>
    );
}
