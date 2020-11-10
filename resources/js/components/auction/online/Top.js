import React from "react";
import __ from '../../../utils/trans';
import Countdown from "../Countdown";

export default function OnlineTop(props) {
    const { auction } = props;
    return (
        <section
            className="auction-announce auction-online"
            style={{
                backgroundImage: "url(" + auction.thumbnail + ")",
                backgroundPosition: "top center"
            }}
        >
            <div className="darkener">
                <div className="container">
                    <Countdown date={auction.dateatom} />
                    <div className="h1">{auction.title}<br/><span className="online">{__('ONLINE_BROADCAST_IN_PROPGRESS_TEXT')}</span></div>
                </div>
            </div>
        </section>
    );
}
