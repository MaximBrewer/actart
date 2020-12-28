import React, { useState } from "react";
import { Link, useLocation, useHistory } from "react-router-dom";
import { resetPassword } from "../api/auth";
import useInputValue from "../components/input-value";
import qs from "qs";
import __ from "../utils/trans";

function ResetPassword(props) {
    const { openModal, closeModal } = props;
    let history = useHistory();

    const token = useLocation().pathname.split("/")[3];

    let [passwordResetFeedback, setPasswordResetFeedback] = useState("");
    let email = useInputValue(
        "email",
        useLocation().search
            ? qs.parse(useLocation().search, { ignoreQueryPrefix: true }).email
            : ""
    );
    let password = useInputValue("password");
    let passwordConfirmation = useInputValue("password_confirmation");

    const handleSubmit = e => {
        e.preventDefault();
        [email, password, passwordConfirmation].forEach(({ setError }) =>
            setError("")
        );

        resetPassword({
            email: email.value,
            password: password.value,
            password_confirmation: passwordConfirmation.value,
            token: token
        })
            .then(status => {
                [
                    email,
                    password,
                    passwordConfirmation
                ].forEach(({ setValue }) => setValue(""));
                setPasswordResetFeedback(status);
                history.push("/");
            })
            .catch(error => {
                error.json().then(({ errors }) => {
                    setPasswordResetFeedback("");
                    [
                        email,
                        password,
                        passwordConfirmation
                    ].forEach(({ parseServerError }) =>
                        parseServerError(errors)
                    );
                });
            });
    };

    return (
        <div className={`modal-content`}>
            <div className="modal-header">
                <h5 className="modal-title">{__("MODAL_RP_H2")}</h5>
                <button type="button" className="close" onClick={closeModal}>
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            {passwordResetFeedback ? (
                <div className={`modal-body`}>
                    <div role="alert">
                        <p> {passwordResetFeedback}</p>
                    </div>
                    <div className="form-group">
                        <a href="#" onClick={() => openModal("login")}>
                            {__("MODAL_RP_LOGIN")}
                        </a>
                    </div>
                </div>
            ) : (
                <form
                    onSubmit={handleSubmit}
                    method="POST"
                    className="border rounded bg-white border-grey-light w-3/4 sm:w-1/2 lg:w-2/5 xl:w-1/3 px-8 py-4"
                >
                    <div className={`modal-body`}>
                        <div className="form-group">
                            <label htmlFor="email">
                                {__("MODAL_RP_EMAIL")}
                            </label>
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
                                    {email.error}
                                </div>
                            )}
                        </div>
                        <div className="form-group">
                            <label htmlFor="password">
                                {__("MODAL_RP_PASSWORD")}
                            </label>
                            <input
                                type="password"
                                id="password"
                                name="password"
                                className={`form-control ${
                                    password.error ? "is-invalid" : ""
                                }`}
                                minLength={8}
                                required
                                {...password.bind}
                            />
                            {password.error && (
                                <div className="invalid-feedback">
                                    {password.error}
                                </div>
                            )}
                        </div>
                        <div className="form-group">
                            <label htmlFor="password-confirmation">
                                {__("MODAL_RP_PASSWORD_CONFIRMATON")}
                            </label>
                            <input
                                type="password"
                                id="password-confirmation"
                                name="password_confirmation"
                                minLength={8}
                                className={`form-control ${
                                    passwordConfirmation.error
                                        ? "is-invalid"
                                        : ""
                                }`}
                                required
                                {...passwordConfirmation.bind}
                            />
                        </div>
                    </div>
                    <div className={`modal-footer`}>
                        <div className="form-group">
                            <button type="submit" className="btn btn-primary">
                                {__("MODAL_RP_BTN")}
                            </button>
                        </div>
                    </div>
                </form>
            )}
        </div>
    );
}

export default ResetPassword;
