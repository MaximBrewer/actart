import React from "react";
import __ from "../../../utils/trans";
import Countdown from "../Countdown";
import { Link } from "react-router-dom";
import { useAuth } from "../../../context/auth";

export default function Bottom(props) {
    const { auction, participate } = props;
    let { inAuctions } = useAuth();
    return (
        <div className="auction-footer">
            <div className="container">
                <div className="row justify-content-center my-5">
                    <div className="col-lg-30 h-center">
                        <Countdown date={auction.dateatom} />
                    </div>
                </div>
                <div className="row justify-content-center my-5">
                    <div className="col-lg-15">
                        {inAuctions ? (
                            <div className="d-flex flex-column justify-content-center">
                                <Link
                                    to={"/auctions/" + auction.id}
                                    className="btn btn-danger"
                                >
                                    {__("ALREADY_REGISTERED")}
                                </Link>
                                <p className="text-center py-3">{__("#ALREADY_REGISTERED_HELP#")}</p>
                            </div>
                        ) : (
                            <Link
                                to={"/auctions/" + auction.id}
                                className="btn btn-danger"
                                onClick={e => participate(e, auction)}
                            >
                                {__("PARTICIPATE")}
                            </Link>
                        )}
                    </div>
                </div>
                <div className="row justify-content-center my-5">
                    <div className="col-lg-15">
                        <Link to="/auctions" className="btn btn-default w-100">
                            {__("BTN_ALL_AUCTIONS")}
                        </Link>
                    </div>
                    <div className="col-lg-15">
                        <Link to="/gallery" className="btn btn-default w-100">
                            {__("BTN_ONLINE_GALLERY")}
                        </Link>
                    </div>
                </div>
            </div>
        </div>
    );
}
