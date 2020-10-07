import React, { useEffect, useState } from "react";

export default function Flash() {
    let [visibility, setVisibility] = useState(false);
    let [message, setMessage] = useState("");
    let [type, setType] = useState("");

    useEffect(() => {
        window.addEventListener("flash", function(event) {
            setVisibility(true);
            setMessage(event.detail.message);
            setType(event.detail.type);
            setTimeout(() => {
                setVisibility(false);
            }, 4000);
        });
    }, []);

    useEffect(() => {
        if (document.querySelector(".close") !== null) {
            document
                .querySelector(".close")
                .addEventListener("click", () => setVisibility(false));
        }
    });

    return (
        visibility && (
            <div className={`alert alert-${type}`}>
                <p>{message}</p>
                <span className="close">
                    <strong>&times;</strong>
                </span>
            </div>
        )
    );
}
