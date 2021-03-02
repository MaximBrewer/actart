import React, { useState, useRef } from "react";
import { useAuth } from "../context/auth";
import __ from "../utils/trans";
import SignaturePad from "react-signature-canvas";

function Sign(props) {
    const { openModal, closeModal } = props;
    let { setCurrentUser, setToken, currentUser } = useAuth();

    let sigPad = {};

    const clear = () => {
        sigPad.clear();
    };

    const trim = () => {
        setCurrentUser(prevState => ({
            ...prevState,
            sign: sigPad.getTrimmedCanvas().toDataURL("image/png")
        }));
        closeModal();
    };

    return (
        <div className={`modal-content sing-modal`}>
            <div className="modal-header">
                <h5 className="modal-title">{__("#MODAL_SIGN_H2#")}</h5>
                <small></small>
                <button type="button" className="close" onClick={closeModal}>
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div className={`modal-body`}>
                <div
                    style={{
                        width: "24rem",
                        height: "8rem"
                    }}
                >
                    <div
                        style={{
                            position: "relative",
                            width: "100%",
                            height: "100%"
                        }}
                    >
                        <SignaturePad
                            canvasProps={{ className: "sigPad" }}
                            ref={ref => {
                                sigPad = ref;
                            }}
                        />
                    </div>
                </div>
                <div className="d-flex">
                    <button
                        onClick={clear}
                        className="btn btn-default btn-sm"
                        style={{ marginRight: "1rem" }}
                    >
                        {__("#CLEAR_SIGN#")}
                    </button>
                    <button onClick={trim} className="btn btn-default btn-sm">
                        {__("#SIGN_SIGN#")}
                    </button>
                </div>
            </div>
        </div>
    );
}

export default Sign;
