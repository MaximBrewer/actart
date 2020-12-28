import React, { useState } from "react";
import { useAuth } from "../context/auth";
import __ from "../utils/trans";
import { Mail } from "../icons/footer";
import useInputValue from "../components/input-value";

export default function Subscribe(props) {
    const { req } = props;

    let { currentUser } = useAuth();
    let [resetSubscribe, setResetSubscribe] = useState("");

    let email = useInputValue("email", !!currentUser ? currentUser.email : "");

    const handleSubmit = e => {
        e.preventDefault();

        req("/api/" + window.App.locale + "/subscribe/", "PATCH", {
            email: email.value
        })
            .then(({ status }) => {
                setResetSubscribe(status);
                email.reset()
            })
            .catch(error => {
                error.json().then(({ errors }) => {
                    [email].forEach(({ parseServerError }) =>
                        parseServerError(errors)
                    );
                });
            });
    };

    return (
        <form action="#" onSubmit={handleSubmit}>
            <div className="form-group mb-0">
                <label htmlFor="subscribeFooterEmail">
                    {__(
                        "Be the first to know about new lots, special offers, new exhibitions in our mailing list"
                    )}
                </label>
                <div className="input-group" style={{ flexWrap: "nowrap" }}>
                    <div
                        className="input-group-prepend d-none d-lg-block"
                        onClick={handleSubmit}
                        style={{ cursor: "pointer" }}
                    >
                        <Mail />
                    </div>
                    <div style={{ flex: "1 1 auto" }}>
                        <input
                            type="email"
                            name="email"
                            style={{ width: "100%" }}
                            className={`form-control ${
                                email.error ? "is-invalid" : ""
                            }`}
                            required
                            {...email.bind}
                            aria-describedby="email"
                            placeholder={__("Your E-mail")}
                        />
                        {email.error && (
                            <div className="invalid-feedback">
                                {email.error}
                            </div>
                        )}
                        {resetSubscribe ? (
                            <div className="ifeedback">
                                <p>{resetSubscribe}</p>
                            </div>
                        ) : (
                            ``
                        )}
                    </div>
                </div>
            </div>
        </form>
    );
}
