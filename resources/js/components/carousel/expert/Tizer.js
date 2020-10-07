import React from "react";

export default function Tizer(props) {
    const { data, item } = props;
    const url = "/events/" + item.id;

    return (
        <div className="expert-slide">
            <div className="slide-inner">
                <div
                    className="image mb-4"
                    style={{
                        backgroundImage: 'url("' + item.thumbnail + '")'
                    }}
                ></div>
                <div className="fio">
                    {item.name}
                    <br />
                    {item.lastname}
                </div>
                <div className="description">{item.description}</div>
            </div>
        </div>
    );
}
