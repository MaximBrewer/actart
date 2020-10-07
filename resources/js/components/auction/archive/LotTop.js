import React from "react";
import Countdown from "../Countdown";

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
                    <div className="h1">{auction.title}</div>
                    <a
                        href={"/auctions/" + auction.id}
                        className="btn btn-danger mb-3"
                        onClick={e => {
                            e.preventDefault();
                            props.participate(auction.id);
                        }}
                    >
                        {__("PARTICIPATE")}
                    </a>
                    <div className="h3">{auction.date} &nbsp;&nbsp;&nbsp;</div>
                </div>
            </div>
        </section>
    );
}
