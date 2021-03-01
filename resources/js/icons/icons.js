import React, { useEffect, useState } from "react";
import { useAuth } from "../context/auth";
import client from "../api/client";
import __ from "../utils/trans";

export function FavoriteBig(props) {
    const { item, req } = props;
    const [active, setActive] = useState(false);
    let { setCurrentUser, currentUser } = useAuth();

    useEffect(() => {
        !!currentUser &&
            setActive(
                currentUser.favorites.filter(obj => obj.id == item.id).length
            );
    }, [currentUser]);

    const toFavorite = e => {
        e.preventDefault();
        if (!currentUser) {
            props.openModal("login");
        }

        let action = active ? "remove" : "add";

        req(
            "/api/" +
                window.App.locale +
                "/profile/favorites/" +
                action +
                "/" +
                item.id,
            "PATCH"
        )
            .then(({ user }) => {
                window.dispatchEvent(
                    new CustomEvent("flash", {
                        detail: {
                            message:
                                action == "add"
                                    ? __("Added to favorites")
                                    : __("Removed from favorites"),
                            type: action == "add" ? "success" : "danger",
                            delay: 4000
                        }
                    })
                );
                setCurrentUser(user);
            })
            .catch(() => null);
    };
    return (
        <div className="lot-favorite">
            <div
                onClick={e => toFavorite(e)}
                className={active ? `favorite-link active` : `favorite-link`}
            >
                <div>
                    {active ? __("LOT_FAVORITE_IN") : __("LOT_FAVORITE_OUT")}
                </div>
                <FavoriteIcon />
            </div>
        </div>
    );
}

export function Favorite(props) {
    const { item, req } = props;
    const [active, setActive] = useState(false);
    let { setCurrentUser, currentUser } = useAuth();

    useEffect(() => {
        !!currentUser &&
            setActive(
                currentUser.favorites.filter(obj => obj.id == item.id).length
            );
    }, [currentUser]);

    const toFavorite = e => {
        e.preventDefault();
        if (!currentUser) {
            props.openModal("login");
        }

        let action = active ? "remove" : "add";

        req(
            "/api/" +
                window.App.locale +
                "/profile/favorites/" +
                action +
                "/" +
                item.id,
            "PATCH"
        )
            .then(({ user }) => {
                window.dispatchEvent(
                    new CustomEvent("flash", {
                        detail: {
                            message:
                                action == "add"
                                    ? __("Added to favorites")
                                    : __("Removed from favorites"),
                            type: action == "add" ? "success" : "danger",
                            delay: 4000
                        }
                    })
                );
                setCurrentUser(user);
            })
            .catch(err => console.log(err));
    };

    return (
        <div
            onClick={e => toFavorite(e)}
            className={active ? `favorite-link active` : `favorite-link`}
        >
            <FavoriteIcon />
        </div>
    );
}

export function FavoriteIcon() {
    return (
        <svg viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">
            <circle cx="11" cy="11" r="10.5" />
            <path d="M11.007 7C4.16959 7 2.08566 11.8388 2 12.0451L4.14935 13.02C4.1914 12.9242 4.88293 11.3952 6.85005 10.3715C6.75156 10.7502 6.70181 11.1409 6.70209 11.5333C6.70127 12.1194 6.8112 12.7 7.02559 13.2418C7.23998 13.7836 7.55463 14.2759 7.95155 14.6908C8.34846 15.1056 8.81987 15.4348 9.3388 15.6594C9.85773 15.884 10.414 15.9998 10.9759 16H11.0335C12.1662 16.0009 13.2528 15.5326 14.0548 14.6981C14.8567 13.8637 15.3083 12.7312 15.3104 11.5496C15.3113 11.1658 15.2647 10.7835 15.1718 10.4122C17.1077 11.4472 17.8288 12.955 17.8709 13.046L20 12.0159C19.9112 11.8112 17.6933 7 11.007 7ZM13.4694 13.5969H10.75V10.7599H13.4694V13.5969Z" />
        </svg>
    );
}

export function ArrowPrew() {
    return (
        <svg
            width="39"
            height="36"
            viewBox="0 0 39 36"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M20.5946 3L6 18L20.5946 33"
                stroke="#1B292B"
                strokeWidth="8"
            />
            <path
                d="M7.62164 17.5946H38.4325"
                stroke="#1E2B32"
                strokeWidth="8"
            />
        </svg>
    );
}

export function ArrowNext() {
    return (
        <svg
            width="39"
            height="36"
            viewBox="0 0 39 36"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M18.4054 33L33 18L18.4054 3"
                stroke="#1B292B"
                strokeWidth="8"
            />
            <path
                d="M31.3784 18.4054L0.567543 18.4054"
                stroke="#1E2B32"
                strokeWidth="8"
            />
        </svg>
    );
}

export function Hammer() {
    return (
        <svg viewBox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect
                width="10"
                height="5"
                rx="1"
                transform="matrix(0.734421 0.678694 -0.678693 0.734423 7.18018 -0.401611)"
                fill="#FF665E"
            />
            <rect
                width="2"
                height="8"
                transform="matrix(0.734421 0.678694 -0.678693 0.734423 6.0457 6.71973)"
                fill="#FF665E"
            />
        </svg>
    );
}

export function ZoomIn() {
    return (
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M0 0h24v24H0V0z" fill="none" />
            <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
            <path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z" />
        </svg>
    );
}

export function ZoomOut() {
    return (
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M0 0h24v24H0V0z" fill="none" />
            <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14zM7 9h5v1H7z" />
        </svg>
    );
}

export function ZoomReset() {
    return (
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M0 0h24v24H0z" fill="none" />
            <path d="M14.59 8L12 10.59 9.41 8 8 9.41 10.59 12 8 14.59 9.41 16 12 13.41 14.59 16 16 14.59 13.41 12 16 9.41 14.59 8zM12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z" />
        </svg>
    );
}

export function Close() {
    return (
        <svg
            width="29"
            height="29"
            viewBox="0 0 512 512"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path d="M443.6,387.1L312.4,255.4l131.5-130c5.4-5.4,5.4-14.2,0-19.6l-37.4-37.6c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4  L256,197.8L124.9,68.3c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4L68,105.9c-5.4,5.4-5.4,14.2,0,19.6l131.5,130L68.4,387.1  c-2.6,2.6-4.1,6.1-4.1,9.8c0,3.7,1.4,7.2,4.1,9.8l37.4,37.6c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1L256,313.1l130.7,131.1  c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1l37.4-37.6c2.6-2.6,4.1-6.1,4.1-9.8C447.7,393.2,446.2,389.7,443.6,387.1z" />
        </svg>
    );
}

export function OkIcon() {
    return (
        <svg width="1.5rem" height="1.5rem" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8267.72 8267.72">
            <g>
                <path
                    fill="#006C3B"
                    d="m716.82 4324.3c731.31 313.61 827.71 357.49 1567.8 675.18 40.476 17.968 72.394 31.791 101.49 46.122 50.76 27.555 77.339 53.453 127.28-15.287 16.882-17.106 46.268-32.858 65.602-65.449 1771.2-1641.6 3104.2-2926.1 4875.4-4567.7 311.45-314.04 957.14-82.315 668.75 262.42-1819 2115.1-3013.9 3557.1-3898.3 4727.1-378.15 498.87-701.18 948.44-991.49 1378.7-190.68 277.3-364.94 546.58-526.53 815.85-46.827 81.508-85.945 138.84-146.8 184.88-95.28 67.846-199.82 75.197-302.62 18.468-38.555-25.295-76.043-57.032-113.86-103.76-22.693-28.032-45.508-64.331-68.74-99.854l-553.4-911.48-623.12-1098.3c-170.56-300.64-307.26-550.24-571.63-1007.6-28.921-43.067-111.65-155.14-87.535-238.72 20.748-95.457 124.86-147.42 234.97-102.71 98.807 41.689 197.58 84.988 242.72 102.13z"
                />
            </g>
            <g>
                <path
                    fill="#77C06C"
                    d="m431.48 4322.7c694.72 300.72 1260.1 541.86 1963.1 846.5 48.492 21.169 97.638 26.933 146.55-15.724 1682.6-1574.1 3327.4-3117.8 5010-4692 220.55-198.94 645.36-76.925 509.09 107.46-2981.1 3437.6-4547.9 5449-5497.6 7037.3-86.311 145.08-250.18 136.88-339.06-2.2835-209.35-332.54-525.42-854.16-534.06-867.24-673.5-1175.6-694.99-1224.6-1337.9-2347.4-30.346-55.043 35.429-95.299 79.819-66.681z"
                />
            </g>
        </svg>
    );
}
