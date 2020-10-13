import React from "react";
import { Link } from "react-router-dom";
import __ from '../../../../utils/trans';

export default function Tizer(props) {
    const { data, item } = props;
    return (
        <div className={`auction-item`}>
            <div className="block-loading">
                <div className="block-loading-animation">
                    <div
                        className={`image`}
                    >
                    </div>
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
