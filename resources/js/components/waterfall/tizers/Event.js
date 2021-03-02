import React from "react";
import { Link } from "react-router-dom";
import __ from '../../../utils/trans';

export default function Tizer(props) {
    const { data, item } = props;
    const url = "/events/" + item.id;

    return (
        <div className={`event-item`}>
            <div className="image-holder">
                <Link
                    to={url}
                    className={`image`}
                    style={{
                        backgroundImage: `url(${encodeURI(item.preview)})`
                    }}
                ></Link>
            </div>
            <Link className="title" to={url}>
                {item.title}
            </Link>
            <div className="subtitle">{item.excerpt}</div>
            <div className="date">{item.dates}</div>
            <div className="exhibit">{item.space.title}</div>
            <div className="address">{item.space.address}</div>
        </div>
    );
}
