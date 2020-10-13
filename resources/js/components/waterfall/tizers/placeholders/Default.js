import React from "react";
import { Link } from "react-router-dom";
import __ from '../../../../utils/trans';

export default function Tizer(props) {
    const { data, item } = props;
    return (
        <div className={`event-item`}>
            <div className="block-loading">
                <div className="block-loading-animation">
                    <div
                        className={`image image-loading`}
                    >
                    </div>
                </div>
            </div>
            <div className="block-loading mt-4">
                <div className="block-loading-animation">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
            <div className="block-loading">
                <div className="block-loading-animation">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div >
    );
}
