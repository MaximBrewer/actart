import React from "react";
import __ from '../../../utils/trans';
import Countdown from "../Countdown";
import { Link } from "react-router-dom";

export default function Top(props) {
    const { auction } = props;
    return (
        <section
            className="auction-announce auction-coming"
            style={{
                backgroundImage: "url(" + auction.thumbnail + ")",
                backgroundPosition: "top center"
            }}
        >
            <div className="darkener">
                <div className="container">
                    <Countdown date={auction.dateatom} />
                    <div className="h1"><Link to={`/auctions/` + auction.id}>{auction.title}</Link></div>
                    <div className="h3">{auction.date} &nbsp;&nbsp;&nbsp;</div>
                </div>
            </div>
        </section>
    );
}
