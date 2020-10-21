import React, { useEffect, useState } from "react";
import { Close } from "../icons/icons";
import __ from "../utils/trans";
import Parser from "html-react-parser";

export default function Flash() {
    const [state, setState] = useState({
        visibility: false,
        message: null,
        header: null,
        buttons: null,
        type: "success",
        delay: 0,
    });


    useEffect(() => {
        window.addEventListener("flash", function (event) {
            setState({
                visibility: true,
                message: event.detail.message,
                header: event.detail.header,
                buttons: event.detail.buttons,
                type: event.detail.type,
                delay: event.detail.delay,
            })
            if (event.detail.delay)
                setTimeout(() => {
                    setState((prevState) => ({
                        ...prevState,
                        visibility: false
                    }));
                }, event.detail.delay);
        });
    }, []);

    const hide = () => setState((prevState) => ({
        ...prevState,
        visibility: false
    }));

    return (
        state.visibility && (
            <div className={`flash-message ${state.type}`}>
                <span className="close" onClick={hide}>
                    <Close />
                </span>
                {state.header ? 
                <div className={`header text-center mb-3`}>
                    <h3>{state.header}</h3>
                </div> : ``}
                {state.message ? 
                <div className={`content mb-3`}>
                    {Parser(state.message)}
                </div> : ``}
                {state.buttons ? 
                <div className={`buttons text-right`} onClick={hide}>
                    <button className={`btn btn-sm btn-${state.type}`}>{__("OK")}</button>
                </div> : ``}
            </div>
        )
    );
}
