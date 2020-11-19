import React from "react";
import __ from '../../../utils/trans';
import Countdown from "../Countdown";
import { Link } from "react-router-dom";

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
                    <Link
                        to={`/auctions/` + state.id}
                        className="btn btn-default-inverse"
                    >
                        <div className="h1">{auction.title}<br /><span className="online">{__('ONLINE_BROADCAST_IN_PROPGRESS_TEXT')}</span></div>
                    </Link>
                </div>
            </div>
        </section>
    );
}
