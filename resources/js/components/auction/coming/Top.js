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
                            {auction.header_text}
                        </Link>
                    </div>
                    {!!currentUser ? (
                        inAuctions(auction.id) ? (
                            <Link
                                to={"/auctions/" + auction.id}
                                className="btn btn-danger mb-2"
                            >
                                {__("#YOUR_STATUS_IS:#")}{" "}
                                {!!currentUser && currentUser.vip
                                    ? __("#VIP_STATUS#")
                                    : __("#GUEST_STATUS#")}
                            </Link>
                        ) : (
                            <Link
                                to={"/auctions/" + auction.id}
                                className="btn btn-danger mb-2"
                                onClick={e => participate(e, auction)}
                            >
                                {__("PARTICIPATE")}
                            </Link>
                        )
                    ) : (
                        <div className="text-center text-xl-left my-3">
                            <a
                                href="#"
                                className="btn btn-danger"
                                onClick={e => {
                                    e.preventDefault();
                                    props.openModal("login");
                                }}
                            >
                                {__("PARTICIPATE")}
                            </a>
                        </div>
                    )}
                    <div className="h3">{auction.date} &nbsp;&nbsp;&nbsp;</div>
                </div>
            </div>
        </section>
    );
}
