
import ReactParser from "html-react-parser";
import React, { useState, useEffect, useRef } from "react";
import Carousel from "../components/Carousel"


export default function Parser(props) {
    const { body } = props;

    const parse = (str) => {
        let regexp = /\[carousel\s+entity\s*=\s*["']([a-z]+)["']\s+id\s*=\s*["']([0-9]+)["']\]/;
        let result = body.match(regexp);

        return (
            result ? <React.Fragment>
                <section>{ReactParser(str.substr(0, result.index))}</section>
                {!!result[1] && !!result[2] ? <Carousel entity={result[1]} id={result[2]} {...props} /> : ``}
                <section>{ReactParser(str.substr(result.index + result[0].length, result.input.length))}</section>
            </React.Fragment> : ReactParser(body)

        )
    }

    return body ? parse(body) : ``;
}