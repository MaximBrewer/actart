import React, { useState, useRef } from "react";
import { Link } from "react-router-dom";
import { useAlert } from "react-alert";
import client from "../api/client";
import { useAuth } from "../context/auth";

const ProfileContract = props => {
    const alert = useAlert();
    const { req, openModal, closeModal } = props;
    let { setCurrentUser, setToken, currentUser } = useAuth();

    const fioRef = useRef(null);
    const taskRef = useRef(null);
    const emailRef = useRef(null);
    const phoneRef = useRef(null);

    const handleSubmit = e => {
        e.preventDefault();

        req("/api/contract/sign", {
            body: {
                sign: fioRef.current.textContent.trim()
            }
        })
            .then(data => {
                alert.show(data.message, {
                    timeout: 3000,
                    type: "success"
                });
                // sign.current.textContent = " ";
            })
            .catch(error => {
                error.json().then(({ errors }) => {
                    let errorText = "";
                    for (error in errors) {
                        if (errors[error]) {
                            errorText += errors[error][0] + "\n";
                        }
                    }
                    alert.show(errorText, {
                        timeout: 7000,
                        type: "error"
                    });
                });
            });
    };

    return (
        <div className="">
            <section className="">
                <div className="container py-5">
                    <section className="text-container breadcrumbs-offset">
                        <h1>Договор</h1>
                        <p>
                            <b>I.</b> Я,{" "}
                            <span
                                ref={fioRef}
                                style={{ textDecoration: "underline" }}
                                className="text-underline"
                                contentEditable
                                suppressContentEditableWarning="true"
                            >
                                &emsp;
                            </span>
                        </p>
                        <p>
                            <b>II.</b> Договор...
                        </p>
                        <p>
                            <b>III.</b> Стороны..., в лице .
                        </p>
                        <div className="row">
                            <div className="col-30">
                                <h3>Сторона I</h3>
                                <span
                                    ref={taskRef}
                                    style={{ textDecoration: "underline" }}
                                    className="text-underline"
                                    contentEditable
                                    suppressContentEditableWarning="true"
                                >
                                    &emsp;
                                </span>
                            </div>
                            <div className="col-30">
                                <h3>Сторона II</h3>
                                <span
                                    ref={emailRef}
                                    style={{ textDecoration: "underline" }}
                                    className="text-underline"
                                    contentEditable
                                    suppressContentEditableWarning="true"
                                >
                                    &emsp;
                                </span>
                                <div
                                    className="sign-area border"
                                    onClick={() => openModal("sign")}
                                    style={{
                                        padding: ".5rem 1.5rem",
                                        height: "6rem",
                                        width: "18rem"
                                    }}
                                >
                                    <div
                                        style={{
                                            backgroundPosition: "center",
                                            backgroundSize: "contain",
                                            backgroundRepeat: "no-repeat",
                                            backgroundImage: `url(${currentUser.sign})`,
                                            height: "5rem",
                                            width: "15rem"
                                        }}
                                    ></div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <br />
                    <br />
                    <br />
                    <div className="">
                        <div className="">
                            <button
                                className=""
                                type="button"
                                onClick={handleSubmit}
                            >
                                Сохранить
                            </button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
};

export default ProfileContract;
