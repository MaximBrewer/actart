import React from "react";
import __ from '../../../utils/trans';
import Countdown from "../Countdown";

export default function ArchiveTop(props) {
    const { auction } = props;
    return (
        <section
            className="auction-announce auction-archive"
            style={{
                backgroundImage: "url(" + auction.thumbnail + ")",
                backgroundPosition: "top center"
            }}
        >
            <div className="darkener">
                <div className="container">
                    <div className="h1">{auction.title}</div>
                    <div className="h3">{auction.date} &nbsp;&nbsp;&nbsp;{__('BIDDING_FINISHED_TEXT')}</div>
                </div>
            </div>
        </section>
    );
}
