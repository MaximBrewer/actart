import React from "react";
import __ from "../../../utils/trans";
import Countdown from "../Countdown";
import { Link } from "react-router-dom";
import { useAuth } from "../../../context/auth";

export default function Bottom(props) {
    const { auction, participate } = props;
    let { inAuctions, currentUser } = useAuth();
    return (
        <div className="auction-footer">
            <div className="container">
                <div className="row justify-content-center mt-5 mb-2">
                    <div className="col-lg-30 h-center">
                        <Countdown date={auction.dateatom} />
                    </div>
                </div>
                {!!currentUser ? (
                    <div className="row justify-content-center mt-2 mb-4">
                        <div className="col-lg-40 text-center">
                            {inAuctions(auction.id) ? (
                                <div className="d-flex flex-column justify-content-center">
                                    <p className="text-center pb-3">
                                        {__("#ALREADY_REGISTERED_HELP#")}
                                    </p>
                                    <div className="text-center mb-3">
                                        <Link
                                            to={"/auctions/" + auction.id}
                                            className="btn btn-danger"
                                        >
                                            {currentUser.vip
                                                ? __(
                                                      "#ALREADY_REGISTERED_VIP_STATUS#"
                                                  )
                                                : __(
                                                      "#ALREADY_REGISTERED_GUEST_STATUS#"
                                                  )}
                                            {/* {__("ALREADY_REGISTERED")} */}
                                        </Link>
                                    </div>
                                    {currentUser.vip ? (
                                        ``
                                    ) : (
                                        <strong
                                            style={{
                                                textAlign: "center",
                                                margin: "0 auto",
                                                maxWidth: "80%",
                                                display: "block"
                                            }}
                                        >
                                            <span className={`color-red`}>
                                                {__("#ATTENTION!#")}
                                            </span>{" "}
                                            {__("#VIP_FOR_PARTICIPATE_TEXT#")}{" "}
                                            <Link
                                                to={`/profile/vip`}
                                                style={{ whiteSpace: "nowrap" }}
                                                className={`color-red font-weight-bolder`}
                                            >
                                                {__(
                                                    "#VIP_FOR_PARTICIPATE_LINK#"
                                                )}
                                            </Link>
                                        </strong>
                                    )}
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
                ) : (
                    <div className="text-center my-3">
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
                <div className="row justify-content-center my-5 md-py-5">
                    <div className="col-lg-15">
                        <Link
                            to="/auctions"
                            className="btn btn-default w-100 mb-2"
                        >
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
