import React from "react";
import __ from "../../../utils/trans";
import Parser from "html-react-parser";
import { Link } from "react-router-dom";
import { useAuth } from "../../../context/auth";

export default function Center(props) {
    const { currentUser } = useAuth();
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
                        <div className="link-holder">
                            <Link to={`/rules`}>
                                {__("Participation rules")}
                            </Link>
                        </div>
                        {currentUser && currentUser.vip ? (
                            ``
                        ) : (
                            <>
                                <strong
                                    style={{
                                        margin: "0.7rem 0",
                                        display: "block"
                                    }}
                                >
                                    <span className={`color-red`}>
                                        {__("#ATTENTION!#")}
                                    </span>{" "}
                                    {__("#VIP_FOR_PARTICIPATE_TEXT#")}{" "}
                                    {currentUser ? (
                                        <Link
                                            to={`/profile/vip`}
                                            style={{ whiteSpace: "nowrap" }}
                                            className={`color-red font-weight-bolder`}
                                        >
                                            {__("#VIP_FOR_PARTICIPATE_LINK#")}
                                        </Link>
                                    ) : (
                                        <a
                                            href="#"
                                            onClick={e => {
                                                e.preventDefault();
                                                props.openModal("login");
                                            }}
                                            style={{
                                                whiteSpace: "nowrap",
                                                textDecoration: "underline"
                                            }}
                                            className={`color-red font-weight-bolder`}
                                        >
                                            {__("#VIP_FOR_PARTICIPATE_LINK#")}
                                        </a>
                                    )}
                                </strong>
                            </>
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
}
