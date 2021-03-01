import React, { useState, useRef } from "react";
import { Link } from "react-router-dom";
import { useAlert } from "react-alert";
import client from "../api/client";

const Brief = () => {
    const alert = useAlert();

    const fioRef = useRef(null);
    const taskRef = useRef(null);
    const emailRef = useRef(null);
    const phoneRef = useRef(null);

    const handleSubmit = e => {
        e.preventDefault();

        client("/api/brief", {
            body: {
                brand: fioRef.current.textContent.trim(),
                task: taskRef.current.textContent.trim(),
                email: emailRef.current.textContent.trim(),
                phone: phoneRef.current.textContent.trim()
            }
        })
            .then(data => {
                alert.show(data.message, {
                    timeout: 3000,
                    type: "success"
                });
                fioRef.current.textContent = " ";
                taskRef.current.textContent = " ";
                emailRef.current.textContent = " ";
                phoneRef.current.textContent = " ";
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
                                style={{textDecoration: "underline"}}
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
                                    style={{textDecoration: "underline"}}
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
                                    style={{textDecoration: "underline"}}
                                    className="text-underline"
                                    contentEditable
                                    suppressContentEditableWarning="true"
                                >
                                    &emsp;
                                </span>
                            </div>
                        </div>
                    </section>
                    <br/>
                    <br/>
                    <br/>
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

export default Brief;
