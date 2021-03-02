import React, { useState, useRef } from "react";
import { useAuth } from "../context/auth";
import __ from "../utils/trans";
import SignaturePad from "react-signature-canvas";
import CanvasDraw from "react-canvas-draw";

function Sign(props) {
    const { openModal, closeModal } = props;
    let { setCurrentUser, setToken, currentUser } = useAuth();

    let sigPad = {};

    const clear = () => {
        sigPad.clear();
    };
    const defaultProps = {
        onChange: null,
        loadTimeOffset: 5,
        lazyRadius: 3,
        brushRadius: 2,
        brushColor: "#444",
        catenaryColor: "#0a0302",
        gridColor: "rgba(150,150,150,0.17)",
        hideGrid: false,
        canvasWidth: 400,
        canvasHeight: 400,
        disabled: false,
        imgSrc: "",
        saveData: null,
        immediateLoading: false,
        hideInterface: false
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
                        position: "relative",
                        maxWidth: "32rem",
                        width: "90%",
                        paddingTop: "66.66%",
                        margin: "0 auto"
                    }}
                >
                    <div
                        style={{
                            position: "absolute",
                            width: "100%",
                            height: "100%",
                            top:0,
                            left:0
                        }}
                    >
                        {/* <CanvasDraw {...defaultProps} /> */}
                        <SignaturePad
                            dotSize={50}
                            velocityFilterWeight={0.7}
                            minWidth={1.5}
                            maxWidth={2}
                            minDistance={5}
                            dotSize={() => (this.minWidth + this.maxWidth) / 2}
                            penColor="blue"
                            throttle={4}
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
