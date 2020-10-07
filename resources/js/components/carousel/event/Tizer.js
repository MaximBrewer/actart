import React from "react";

export default function Tizer(props) {
    const { data, item } = props;
    const url = "/events/" + item.id;

    return (
        <div className="event-slide">
            <div className="slide-inner">
                <a
                    href={url}
                    className={`image mb-4`}
                    style={{
                        backgroundImage: "url(" + item.preview + ")"
                    }}
                ></a>
                <a className="title" href={url}>
                    {item.title}
                </a>
                <div className="subtitle">{item.excerpt}</div>
                <div className="date">{item.dates}</div>
                <div className="exhibit">{item.space.title}</div>
                <div className="address">{item.space.address}</div>
            </div>
        </div>
    );
}
