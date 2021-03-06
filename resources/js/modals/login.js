import React from "react";
import { Link, useHistory } from "react-router-dom";
import { useAuth } from "../context/auth";
import { login } from "../api/auth";
import { getIntendedUrl } from "../utils/auth";
import useInputValue from "../components/input-value";
import __ from "../utils/trans";
import client from "../api/client";
import Parser from "html-react-parser";

function LoginModal(props) {
    const { openModal, closeModal } = props;
    let { setCurrentUser, setToken } = useAuth();
    let history = useHistory();
    let email = useInputValue("email");
    let password = useInputValue("password");

    const handleSubmit = e => {
        e.preventDefault();

        login({
            email: email.value,
            password: password.value
        })
            .then(({ user, token }) => {
                setToken(token);
                setCurrentUser(user);
                if (!!window.participate) {
                    let skip = false;
                    for (const a of user.auctions)
                        if (window.participate == a.id) skip = true;
                    if (!skip)
                        client(
                            "/api/auction/" +
                                window.participate +
                                "/participate"
                        )
                            .then(({ user }) => {
                                setCurrentUser(user);
                            })
                            .catch(err => console.log(err));
                    history.push("/auctions/" + window.participate);
                    delete window.participate;
                }
                location.reload();
                closeModal();
            })
            .catch(error => {
                error.json().then(({ errors }) => {
                    email.parseServerError(errors);
                    if(!!errors.modal){
                        window.email = email.value;
                        setTimeout(() => openModal(errors.modal), 1000)
                    }
                });
            });
    };

    return (
        <div className={`modal-content`}>
            <div className="modal-header">
                <h5 className="modal-title">{__("MODAL_LOGIN_H2")}</h5>
                <button type="button" className="close" onClick={closeModal}>
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form onSubmit={handleSubmit} method="POST">
                <div className={`modal-body`}>
                    <div className="form-group">
                        <label htmlFor="email">{__("MODAL_LOGIN_EMAIL")}</label>
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
                                {Parser(email.error ?? "")}
                            </div>
                        )}
                    </div>
                    <div className="form-group">
                        <label htmlFor="password">
                            {__("MODAL_LOGIN_PASSWORD")}
                        </label>
                        <input
                            type="password"
                            id="password"
                            name="password"
                            className="form-control"
                            required
                            {...password.bind}
                        />
                    </div>
                    <div className="form-group">
                        <a href="#" onClick={() => openModal("forgot")}>
                            {__("MODAL_LOGIN_FORGET_PASSWORD")}
                        </a>
                        &nbsp;
                        <a href="#" onClick={() => openModal("register")}>
                            {__("MODAL_LOGIN_SIGN_IN")}
                        </a>
                    </div>
                </div>
                <div className={`modal-footer`}>
                    <div className="form-group">
                        <button type="submit" className="btn btn-primary">
                            {__("MODAL_LOGIN_BTN")}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    );
}

export default LoginModal;
