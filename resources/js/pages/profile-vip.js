import React, { useState, useEffect, useRef } from "react";
import { Link, useHistory } from "react-router-dom";
import __ from "../utils/trans";
import { setIntendedUrl } from "../utils/auth";
import AuctionsProfile from "../components/auction/AuctionsProfile";
import Waterfall from "../components/waterfall/Waterfall";
import useDocumentTitle from "../components/document-title";
import { OkIcon } from "../icons/icons";
import "react-phone-number-input/style.css";
import PhoneInput from "react-phone-number-input";
import { useAlert } from "react-alert";
import { useAuth } from "../context/auth";
import Countdown, { zeroPad } from "react-countdown";

function Profile(props) {
    const alert = useAlert();
    const { req, openModal, closeModal } = props;
    let { setCurrentUser, setToken, currentUser } = useAuth();
    useDocumentTitle(
        currentUser.surname +
            " " +
            currentUser.name +
            " " +
            currentUser.middlename
    );
    const [phone, setPhone] = useState(currentUser.phone);

    const [countdown, setCountdown] = useState(false);

    let history = useHistory();

    const handleLogout = () => {
        setCurrentUser(null);
        setToken(null);
        history.push("/");
        setIntendedUrl(null);
    };

    const declOfNum = (number, titles) => {
        let cases = [2, 0, 1, 1, 1, 2];
        return titles[
            number % 100 > 4 && number % 100 < 20
                ? 2
                : cases[number % 10 < 5 ? number % 10 : 5]
        ];
    };

    const renderer = ({ seconds }) => {
        return (
            <small className="" style={seconds <= 0 ? { display: "none" } : {}}>
                {window.App.locale == "ru"
                    ? `Повторить можно через ${seconds} ${declOfNum(seconds, [
                          "секунду",
                          "секунды",
                          "секунд"
                      ])}`
                    : `Replay in ${seconds} ${declOfNum(seconds, [
                          "second",
                          "seconds",
                          "seconds"
                      ])}`}
            </small>
        );
    };

    const sendCode = () => {
        req("/api/" + window.App.locale + "/send/code/" + phone, "GET")
            .then(({ user }) => {
                setCurrentUser(user);
                setCountdown(
                    <Countdown
                        date={new Date().getTime() + 60000}
                        renderer={renderer}
                        onComplete={() => setCountdown(false)}
                    />
                );
                openModal("code");
            })
            .catch(error => {
                error.json().then(({ errors }) => {
                    if (errors) {
                        if (errors.message)
                            alert.show(__(errors.message), {
                                timeout: 2000,
                                type: "error"
                            });
                    }
                });
            });
    };

    return (
        <section className="profile-section">
            <div className="container">
                <div className="row announce">
                    <div className="col-60">
                        <h5 className="h5">{__("Profile VIP")}</h5>
                        <hr />
                        <dl>
                            <dt>{__("Your ID:")}</dt>
                            <dd>#{currentUser.id}</dd>
                        </dl>
                        <dl>
                            <dt>{__("Status:")}</dt>
                            <dd>
                                {__(currentUser.role.display_name)}{" "}
                                {currentUser.role.name == "user" ? (
                                    <span className="uppercase">
                                        (
                                        {currentUser.vip
                                            ? __("#VIP#")
                                            : __("#GUEST#")}
                                        )
                                    </span>
                                ) : (
                                    ``
                                )}
                            </dd>
                        </dl>
                        <dl>
                            <dt>{__("Full name:")}</dt>
                            <dd>
                                {currentUser.name +
                                    (currentUser.surname
                                        ? ` ` + currentUser.surname
                                        : ``)}
                            </dd>
                        </dl>
                        <dl>
                            <dt>{__("#PROFILE_LOGIN_TEXT#")}:</dt>
                            <dd>
                                {" "}
                                {currentUser.email} <OkIcon />
                            </dd>
                        </dl>
                        <dl>
                            <dt
                                className={`${
                                    currentUser.phone_verified_at
                                        ? ``
                                        : `color-red`
                                }`}
                            >
                                {__("#PROFILE_PHONE_TEXT#")}:
                            </dt>
                            <dd>
                                {currentUser.phone_verified_at ? (
                                    <span>
                                        {currentUser.phone} <OkIcon />
                                    </span>
                                ) : (
                                    <div className="d-flex align-items-center">
                                        <PhoneInput
                                            className="mr-2"
                                            country="RU"
                                            defaultCountry="RU"
                                            placeholder="Enter phone number"
                                            value={phone}
                                            onChange={setPhone}
                                        />
                                        {countdown ? (
                                            countdown
                                        ) : (
                                            <button
                                                onClick={() => sendCode()}
                                                className="btn btn-default btn-sm"
                                            >
                                                {__("#SEND_CODE#")}
                                            </button>
                                        )}
                                    </div>
                                )}
                            </dd>
                        </dl>
                        <dl>
                            <dt
                                className={`${
                                    currentUser.vip ? `` : `color-red`
                                }`}
                            >
                                {__("#PROFILE_CONTRACT_TEXT#")}:
                            </dt>
                            <dd>
                                {currentUser.vip ? (
                                    <strong>
                                        {__("#PROFILE_CONTRACT_SIGNED#")}{" "}
                                        <OkIcon />
                                    </strong>
                                ) : (
                                    <>
                                        <a
                                            target="_blank"
                                            href="https://act-art.na3.documents.adobe.com/public/esignWidget?wid=CBFCIBAA3AAABLblqZhB2ciYi_sxl2AXEJrMNVoeNzorg-zEIzevP1KTAYqXokOZJHhsYflPlFvoY6Ytkzvw*&hosted=false"
                                        >
                                            <strong>
                                                {__("#PROFILE_CONTRACT_LINK#")}
                                            </strong>
                                        </a>
                                        <br />
                                        <small>
                                            {__("#PROFILE_CONTRACT_SIGN#")}
                                        </small>
                                    </>
                                )}
                            </dd>
                        </dl>
                        <hr />
                        <div onClick={handleLogout}>
                            <Link to="/">{__("LOGOUT_LINK")}</Link>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
}

export default Profile;
