import React from "react";
import AuthNav from "../components/auth-nav";
import GuestNav from "../components/guest-nav";
import { useAuth } from "../context/auth";
import __ from "../utils/trans";

function Plug() {
    let { authenticated } = useAuth();

    return (
        <section className="plug">
            <div
                style={{
                    display: "flex",
                    flexDirection: "column",
                    justifyContent: "center",
                    alignItems: "center",
                    minHeight: "100vh",
                    minWidth: "100vw",
                    backgroundColor: "#FF665E",
                    padding:"5vh 10vw"
                }}
            >
                <svg
                    style={{ maxWidth: "604px", width:"100%", maxHeight: "30vh", marginBottom:"3rem" }}
                    viewBox="0 0 604 290"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                >
                    <path
                        d="M300.736 0C70.1635 0 -0.111274 155.916 -3 162.565L69.4808 193.979C70.8988 190.89 94.2187 141.623 160.554 108.639C157.233 120.841 155.555 133.43 155.565 146.073C155.537 164.96 159.244 183.666 166.474 201.124C173.704 218.581 184.314 234.447 197.699 247.814C211.084 261.18 226.981 271.786 244.481 279.025C261.98 286.264 280.74 289.993 299.686 290H301.629C339.825 290.028 376.47 274.94 403.513 248.051C430.557 221.162 445.786 184.672 445.855 146.597C445.885 134.231 444.314 121.913 441.181 109.948C506.466 143.298 530.784 191.885 532.202 194.817L604 161.623C601.006 155.026 526.215 0 300.736 0ZM383.774 212.565H292.07V121.152H383.774V212.565Z"
                        fill="#285671"
                    />
                </svg>
                <h3 style={{ textAlign: "center", color: "#285671" }}>
                    Скоро здесь откроется
                    <br /> онлайн-аукцион
                    <br /> современного искусства
                </h3>
            </div>
        </section>
    );
}

export default Plug;
