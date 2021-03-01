import React, { useState, useRef } from "react";
import { useAuth } from "../context/auth";
import __ from "../utils/trans";
import SignaturePad from "react-signature-canvas";

const Sign = () => {
    let { authenticated } = useAuth();
    const [trimmedDataURL, setTrimmedDataURL] = useState(null);

    // const sigPad = useRef(null);

    let sigPad = {};

    const clear = () => {
        sigPad.clear();
    };

    const trim = () => {
        setTrimmedDataURL(sigPad.getTrimmedCanvas().toDataURL("image/png"));
    };

    return (
        <section className="sing-section">
            <div
                style={{
                    position: "fixed",
                    width: "100%",
                    height: "100%",
                    top: 0,
                    left: 0
                }}
            >
                <div
                    style={{
                        position: "relative",
                        width: "100%",
                        height: "100%",
                        maxWidth: "20rem",
                        top: 0,
                        left: 0
                    }}
                >
                    <SignaturePad
                        canvasProps={{ className: "sigPad" }}
                        ref={ref => {
                            sigPad = ref;
                        }}
                    />
                </div>
                <div>
                    <button onClick={clear}>Clear</button>
                    <button onClick={trim}>Trim</button>
                </div>
                {trimmedDataURL ? <img src={trimmedDataURL} /> : null}
            </div>
        </section>
    );
};

export default Sign;
