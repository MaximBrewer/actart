import React, { useState, useEffect, useRef } from "react";

export default function SearchForm() {
    return (
        <div className="container-fluid">
            <div className="py-2 d-flex">
                <form action="#">
                    <div className="search-container">
                        <input
                            type="text"
                            placeholder={"Поиск.."}
                            name="search"
                            className="form-control"
                        />
                        <button type="submit" className="btn p-1 btn-link">
                            <svg
                                width="29"
                                height="29"
                                viewBox="0 0 29 29"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                            >
                                <ellipse
                                    cx="11.3137"
                                    cy="12.3138"
                                    rx="8"
                                    ry="8"
                                    transform="rotate(-45 11.3137 12.3138)"
                                    strokeWidth="3"
                                />
                                <path
                                    d="M23.7782 24.7782L16 17.0001"
                                    strokeWidth="3"
                                />
                            </svg>
                        </button>
                    </div>
                </form>
                <button type="reset" className="btn p-1 btn-link">
                    <svg
                        width="29"
                        height="29"
                        viewBox="0 0 512 512"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <path d="M443.6,387.1L312.4,255.4l131.5-130c5.4-5.4,5.4-14.2,0-19.6l-37.4-37.6c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4  L256,197.8L124.9,68.3c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4L68,105.9c-5.4,5.4-5.4,14.2,0,19.6l131.5,130L68.4,387.1  c-2.6,2.6-4.1,6.1-4.1,9.8c0,3.7,1.4,7.2,4.1,9.8l37.4,37.6c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1L256,313.1l130.7,131.1  c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1l37.4-37.6c2.6-2.6,4.1-6.1,4.1-9.8C447.7,393.2,446.2,389.7,443.6,387.1z" />
                    </svg>
                </button>
            </div>
        </div>
    );
}
