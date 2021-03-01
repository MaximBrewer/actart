import { useState, useCallback } from "react";
import __ from "../utils/trans";

function InputValue(field, defaultValue = "") {
    let [value, setValue] = useState(defaultValue);
    let [error, setError] = useState("");

    let onChange = useCallback(function(event) {
        setValue(event.currentTarget.value);
        setError("");
    }, []);

    let parseServerError = errors => {
        console.log(__(errors[field][0]));
        if (errors && errors[field]) {
            setError(__(errors[field][0]));
        }
    };

    return {
        value,
        setValue,
        reset: () => setValue(""),
        bind: {
            value,
            onChange
        },
        error,
        setError,
        parseServerError
    };
}

export default InputValue;
