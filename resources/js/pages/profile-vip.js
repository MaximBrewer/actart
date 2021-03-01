import React, { useState, useEffect, useRef } from "react";
import { Link, useHistory } from "react-router-dom";
import { useAuth } from "../context/auth";
import __ from "../utils/trans";
import { setIntendedUrl } from "../utils/auth";
import AuctionsProfile from "../components/auction/AuctionsProfile";
import Waterfall from "../components/waterfall/Waterfall";
import useDocumentTitle from "../components/document-title";
import { OkIcon } from "../icons/icons";
import "react-phone-number-input/style.css";
import PhoneInput from "react-phone-number-input";
import { useAlert } from "react-alert";

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

    let history = useHistory();

    const handleLogout = () => {
        setCurrentUser(null);
        setToken(null);
        history.push("/");
        setIntendedUrl(null);
    };

    const sendCode = () => {
        req("/api/" + window.App.locale + "/send/code/" + phone, "GET")
            .then(() => {
                openModal("code");
            })
            .catch(error => {
                error.json().then(({ errors }) => {
                    console.log(errors)
                    if (errors) {
                        if (errors.message)
                            alert.show(errors.message, {
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
                            <dd>{__(currentUser.role.display_name)}</dd>
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
                            <dt>{__("#PROFILE_PHONE_TEXT#")}:</dt>
                            <dd>
                                {currentUser.phone_verified_at ? (
                                    <span>
                                        {currentUser.phone} <OkIcon />
                                    </span>
                                ) : (
                                    <div className="d-flex">
                                        <PhoneInput
                                            className="mr-2"
                                            country="RU"
                                            defaultCountry="RU"
                                            placeholder="Enter phone number"
                                            value={phone}
                                            onChange={setPhone}
                                        />
                                        <button
                                            onClick={() => sendCode()}
                                            className="btn btn-default btn-sm"
                                        >
                                            {__("#SEND CODE#")}
                                        </button>
                                    </div>
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
