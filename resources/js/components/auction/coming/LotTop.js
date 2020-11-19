import React from "react";
import __ from "../../../utils/trans";
import Countdown from "../Countdown";
import { Link } from "react-router-dom";
import { useAuth } from "../../../context/auth";

export default function Top(props) {
    const { auction, participate } = props;
    let { inAuctions } = useAuth();
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
                    <Link
                        to={`/auctions/` + state.id}
                        className="btn btn-default-inverse"
                    >
                        <div className="h1">{auction.title}</div>
                    </Link>
                    {inAuctions(auction.id) ? (
                        <Link
                            to={"/auctions/" + auction.id}
                            className="btn btn-danger mb-2"
                        >
                            {__("ALREADY_REGISTERED")}
                        </Link>
                    ) : (
                            <Link
                                to={"/auctions/" + auction.id}
                                className="btn btn-danger mb-2"
                                onClick={e => participate(e, auction)}
                            >
                                {__("PARTICIPATE")}
                            </Link>
                        )}
                    <div className="h3">{auction.date} &nbsp;&nbsp;&nbsp;</div>
                </div>
            </div>
        </section>
    );
}
