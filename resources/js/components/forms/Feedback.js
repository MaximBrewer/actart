import React, { useState } from "react";
import { useAuth } from "../../context/auth";
import __ from "../../utils/trans";
import useInputValue from "../../components/input-value";
import Parser from "html-react-parser";
import { useAlert } from "react-alert";

export default function Feedback(props) {
    const { req } = props;
    const alert = useAlert();

    let { currentUser } = useAuth();
    let [resetSubscribe, setResetSubscribe] = useState("");

    let name = useInputValue("name", !!currentUser ? currentUser.name : "");
    let email = useInputValue("email", !!currentUser ? currentUser.email : "");
    let message = useInputValue("message");

    const handleSubmit = e => {
        e.preventDefault();

        req("/api/" + window.App.locale + "/feedback/", "PATCH", {
            name: name.value,
            email: email.value,
            message: message.value
        })
            .then(({ status }) => {
                setResetSubscribe(status);
                alert.show(__(status), {
                    timeout: 5000,
                    type: "success"
                });
                message.reset();
                name.reset();
                email.reset();
            })
            .catch(error => {
                error.json().then(({ errors }) => {
                    [email, message, name].forEach(({ parseServerError }) =>
                        parseServerError(errors)
                    );
                });
            });
    };

    return (
        <form action="#" onSubmit={handleSubmit}>
            <div className="form-group">
                <label htmlFor="name">{__("#FEEDBACK_NAME#")}</label>
                <input
                    id="name"
                    type="text"
                    name="name"
                    className={`form-control ${name.error ? "is-invalid" : ""}`}
                    required
                    {...name.bind}
                />
                {name.error && (
                    <div className="invalid-feedback">{Parser(name.error)}</div>
                )}
            </div>
            <div className="form-group">
                <label htmlFor="email">{__("#FEEDBACK_EMAIL#")}</label>
                <input
                    id="email"
                    type="email"
                    name="email"
                    className={`form-control ${
                        email.error ? "is-invalid" : ""
                    }`}
                    required
                    {...email.bind}
                />
                {email.error && (
                    <div className="invalid-feedback">
                        {Parser(email.error)}
                    </div>
                )}
            </div>
            <div className="form-group">
                <label htmlFor="message">{__("#FEEDBACK_MESSAGE#")}</label>
                <textarea
                    id="message"
                    name="message"
                    className={`form-control ${
                        message.error ? "is-invalid" : ""
                    }`}
                    required
                    {...message.bind}
                />
                {message.error && (
                    <div className="invalid-feedback">
                        {Parser(message.error)}
                    </div>
                )}
            </div>
            <div className="form-group">
                <button type="submit" className="btn btn-primary">
                    {__("#FEEDBACK_BTN#")}
                </button>
            </div>
        </form>
    );
}
