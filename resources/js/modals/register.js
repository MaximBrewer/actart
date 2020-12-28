import React from "react";
import { Link, useHistory } from "react-router-dom";
import { useAuth } from "../context/auth";
import { register } from "../api/auth";
import useInputValue from "../components/input-value";
import __ from "../utils/trans";

function RegisterModal(props) {
    const { openModal, closeModal } = props;
    let history = useHistory();
    let { setCurrentUser, setToken } = useAuth();
    let email = useInputValue("email");
    let name = useInputValue("name");
    let password = useInputValue("password");
    let passwordConfirmation = useInputValue("password_confirmation");

    const handleSubmit = e => {
        e.preventDefault();

        register({
            name: name.value,
            email: email.value,
            password: password.value,
            password_confirmation: passwordConfirmation.value
        })
            .then(({ user, token }) => {
                setCurrentUser(user);
                setToken(token);
                closeModal();
            })
            .catch(error => {
                error.json().then(({ errors }) => {
                    [email, name, password].forEach(({ parseServerError }) =>
                        parseServerError(errors)
                    );
                });
            });
    };

    return (
        <div className={`modal-content`}>
            <div className="modal-header">
                <h5 className="modal-title">{__("MODAL_SIGNIN_H2")}</h5>
                <button type="button" className="close" onClick={closeModal}>
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form onSubmit={handleSubmit} method="POST">
                <div className={`modal-body`}>
                    <div className="form-group">
                        <label htmlFor="username">
                            {__("MODAL_SIGNIN_NAME")}
                        </label>
                        <input
                            id="username"
                            type="text"
                            name="name"
                            className={`form-control ${
                                name.error ? "is-invalid" : ""
                            }`}
                            required
                            {...name.bind}
                        />
                        {name.error && (
                            <div className="invalid-feedback">{name.error}</div>
                        )}
                    </div>
                    <div className="form-group">
                        <label htmlFor="email">
                            {__("MODAL_SIGNIN_EMAIL")}
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
                            {__("MODAL_SIGNIN_PASSWORD")}
                        </label>
                        <input
                            type="password"
                            id="password"
                            name="password"
                            className={`form-control ${
                                password.error ? "is-invalid" : ""
                            }`}
                            minLength={6}
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
                            {__("MODAL_SIGNIN_PASSWORD_CONFIRMATON")}
                        </label>
                        <input
                            type="password"
                            id="password-confirmation"
                            name="password_confirmation"
                            className={`form-control ${
                                passwordConfirmation.error ? "is-invalid" : ""
                            }`}
                            required
                            {...passwordConfirmation.bind}
                        />
                    </div>
                    <div className="form-group">
                        <a href="#" onClick={() => openModal("forgot")}>
                            {__("MODAL_LOGIN_FORGET_PASSWORD")}
                        </a>
                        &nbsp;
                        <a href="#" onClick={() => openModal("login")}>
                            {__("MODAL_SIGNIN_LOGIN")}
                        </a>
                    </div>
                </div>
                <div className={`modal-footer`}>
                    <div className="form-group">
                        <button type="submit" className="btn btn-primary">
                            {__("MODAL_SIGNIN_BTN")}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    );
}

export default RegisterModal;
