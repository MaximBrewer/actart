import React from "react";
import __ from "../../../utils/trans";
import Countdown from "../Countdown";
import { Link } from "react-router-dom";
import { useAuth } from "../../../context/auth";

export default function Top(props) {
    const { auction, participate } = props;
    let { inAuctions, currentUser } = useAuth();
    return (
        <section
            className="auction-announce auction-coming"
            style={{
                backgroundImage: `url(${encodeURI(auction.thumbnail)})`,
                backgroundPosition: "top center"
            }}
        >
            <div className="darkener">
                <div className="container">
                    <Countdown date={auction.dateatom} />
                    <div className="h1">
                        <Link to={`/auctions/` + auction.id}>
                            {auction.title}
                        </Link>
                    </div>
                    {inAuctions(auction.id) ? (
                        <Link
                            to={"/auctions/" + auction.id}
                            className="btn btn-danger mb-2"
                        >
                            {__("#YOUR_STATUS_IS:#")}{" "}
                            {!!currentUser && currentUser.vip
                                ? __("#VIP_STATUS#")
                                : __("#GUEST_STATUS#")}
                            {/* {__("ALREADY_REGISTERED")} */}
                        </Link>
                    ) : (
                        <Link
                            to={"/auctions/" + auction.id}
                            className="btn btn-danger mb-2"
                            onClick={e => participate(e, auction)}
                        >
                            {__("#YOUR_STATUS_IS:#")}{" "}
                            {!!currentUser && currentUser.vip
                                ? __("#VIP_STATUS#")
                                : __("#GUEST_STATUS#")}
                            {/* {__("PARTICIPATE")} */}
                        </Link>
                    )}
                    <div className="h3">{auction.date} &nbsp;&nbsp;&nbsp;</div>
                </div>
            </div>
        </section>
    );
}
