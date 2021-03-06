import React from "react";
import { Link } from "react-router-dom";
import __ from '../../../utils/trans';

export default function Tizer(props) {
    const { data, item } = props;
    const url = "/authors/" + item.id;

    return (
        <div className={`author-item`}>
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
                {item.name + ` ` + item.surname}
            </Link>
            <div className={`professions`}>
                {!item.professions || item.professions.map(
                    (it, i) => (
                        <React.Fragment key={i}>
                            {i ? ' / ' : ''}<span>
                                {it.title}
                            </span>
                        </React.Fragment>
                    )
                )}
            </div>
        </div>
    );
}
