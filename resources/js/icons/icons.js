import React from "react";

export function Favorite(props) {
    const { data, item, toFavorite, favorites } = props;
    return (
        <div
            onClick={e => toFavorite(item.id, e)}
            className={
                favorites && favorites.indexOf(item.id) > -1
                    ? `favorite-link active`
                    : `favorite-link`
            }
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
        <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
        >
            <path d="M0 0h24v24H0V0z" fill="none" />
            <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
            <path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z" />
        </svg>
    );
}

export function ZoomOut() {
    return (
        <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
        >
            <path d="M0 0h24v24H0V0z" fill="none" />
            <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14zM7 9h5v1H7z" />
        </svg>
    );
}

export function ZoomReset() {
    return (
        <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
        >
            <path d="M0 0h24v24H0z" fill="none" />
            <path d="M14.59 8L12 10.59 9.41 8 8 9.41 10.59 12 8 14.59 9.41 16 12 13.41 14.59 16 16 14.59 13.41 12 16 9.41 14.59 8zM12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z" />
        </svg>
    );
}
