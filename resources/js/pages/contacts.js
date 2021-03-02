import React from "react";
import Base from "../pages/base";

export default function Contacts(props) {
    return (
        <>
            <Base {...props} contacts={true} />
        </>
    );
}
