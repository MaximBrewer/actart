import React, { useState } from "react";
import { sendConfirmationCode } from "../api/auth";
import useInputValue from "../components/input-value";
import __ from "../utils/trans";
import { useAuth } from "../context/auth";
import { useAlert } from "react-alert";

function CodeModal(props) {
    let { setCurrentUser } = useAuth();
    const alert = useAlert();
    const { openModal, closeModal } = props;
    let [resetFeedback, setResetFeedback] = useState("");
    let code = useInputValue("code", "");

    const handleSubmit = e => {
        e.preventDefault();

        sendConfirmationCode({ code: code.value })
            .then(user => {
                setCurrentUser(user);
                closeModal();
            })
            .catch(error => {
                error.json().then(({ errors }) => {
                    if (errors.attempts) {
                        closeModal();
                        alert.show(__(errors.message), {
                            timeout: 2000,
                            type: "error"
                        });
                    } else code.parseServerError(errors);
                });
            });
    };

    return (
        <div className={`modal-content`}>
            <div className="modal-header">
                <h5 className="modal-title">{__("#MODAL_CODE_H2#")}</h5>
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
                            <label htmlFor="code">
                                {__("MODAL_CODE_CODE")}
                            </label>
                            <input
                                maxlength="4"
                                minlength="4"
                                id="code"
                                type="text"
                                name="code"
                                className={`form-control ${
                                    code.error ? "is-invalid" : ""
                                }`}
                                required
                                {...code.bind}
                            />
                            {code.error && (
                                <div className="invalid-feedback">
                                    {code.error}
                                </div>
                            )}
                        </div>
                    </div>
                    <div className={`modal-footer`}>
                        <div className="form-group">
                            <button type="submit" className="btn btn-primary">
                                {__("MODAL_CODE_BTN")}
                            </button>
                        </div>
                    </div>
                </form>
            )}
        </div>
    );
}

export default CodeModal;
