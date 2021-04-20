import React from "react";
import __ from "../../../utils/trans";
import Parser from "html-react-parser";
import { Link } from "react-router-dom";
import { useAuth } from "../../../context/auth";

export default function Center(props) {
    const { currentUser, inAuctions } = useAuth();
    const { auction } = props;
    return (
        <div className="auction-info">
            <div className="container">
                <div className="row">
                    <div className="col-lg-45  offset-lg-15">
                        <div className="title-wrapper">
                            <span className="title h3">{auction.title}</span>
                            <span className="date">{auction.date}</span>
                        </div>
                        <div className="sub_2 sublime-wrapper">
                            {Parser(auction.text ?? "")}
                        </div>
                        {!!currentUser ? (
                            <div className="row justify-content-center mt-2 mb-4">
                                <div className="col-lg-60 text-center text-xl-left">
                                    {inAuctions(auction.id) ? (
                                        <div className="d-flex flex-column justify-content-center">
                                            <p className="text-center text-xl-left pb-3">
                                                {__(
                                                    "#ALREADY_REGISTERED_HELP#"
                                                )}
                                            </p>
                                            {/* <div className="text-center text-xl-left mb-3">
                                                <Link
                                                    to={
                                                        "/auctions/" +
                                                        auction.id
                                                    }
                                                    className="btn btn-danger"
                                                >
                                                    {currentUser.vip
                                                        ? __(
                                                              "#ALREADY_REGISTERED_VIP_STATUS#"
                                                          )
                                                        : __(
                                                              "#ALREADY_REGISTERED_GUEST_STATUS#"
                                                          )}
                                                     {__("ALREADY_REGISTERED")} 
                                                </Link>
                                            </div> */}
                                            {currentUser.vip ? (
                                                ``
                                            ) : (
                                                <strong>
                                                    <span
                                                        className={`color-red`}
                                                    >
                                                        {__("#ATTENTION!#")}
                                                    </span>{" "}
                                                    {__(
                                                        "#VIP_FOR_PARTICIPATE_TEXT#"
                                                    )}{" "}
                                                    <Link
                                                        to={`/profile/vip`}
                                                        style={{
                                                            whiteSpace: "nowrap"
                                                        }}
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
                                            onClick={e =>
                                                participate(e, auction)
                                            }
                                        >
                                            {__("PARTICIPATE")}
                                        </Link>
                                    )}
                                </div>
                            </div>
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
                        <div className="link-holder text-center text-xl-left">
                            <Link to={`/rules`}>
                                {__("Participation rules")}
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
