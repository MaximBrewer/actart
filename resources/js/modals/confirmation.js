import React, { useState } from "react";
import { sendConfirmationLink } from "../api/auth";
import useInputValue from "../components/input-value";
import __ from "../utils/trans";

function ForgotPasswordModal(props) {
    const { openModal, closeModal } = props;
    let [resetFeedback, setResetFeedback] = useState("");
    let email = useInputValue("email", window.email ? window.email : "");

    const handleSubmit = e => {
        e.preventDefault();

        sendConfirmationLink({ email: email.value })
            .then(status => setResetFeedback(status))
            .catch(error => {
                error.json().then(({ errors }) => {
                    email.parseServerError(errors);
                });
            });
    };

    return (
        <div className={`modal-content`}>
            <div className="modal-header">
                <h5 className="modal-title">{__("MODAL_CF_H2")}</h5>
                <button type="button" className="close" onClick={closeModal}>
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            {resetFeedback ? (
                <div className={`modal-body`}>
                    <div role="alert">
                        <p> {resetFeedback}</p>
                    </div>
                </div>
            ) : (
                <form onSubmit={handleSubmit} method="POST">
                    <div className={`modal-body`}>
                        <div className="form-group">
                            <label htmlFor="email">
                                {__("MODAL_CF_EMAIL")}
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
                            <a href="#" onClick={() => openModal("login")}>
                                {__("MODAL_CF_LOGIN")}
                            </a>
                        </div>
                    </div>
                    <div className={`modal-footer`}>
                        <div className="form-group">
                            <button type="submit" className="btn btn-primary">
                                {__("MODAL_CF_BTN")}
                            </button>
                        </div>
                    </div>
                </form>
            )}
        </div>
    );
}

export default ForgotPasswordModal;
