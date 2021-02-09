
import ReactParser from "html-react-parser";
import React, { useState, useEffect, useRef } from "react";
import Carousel from "../components/Carousel"


export default function Parser(props) {
    const { body, entity, id } = props;

    const parse = (str) => {
        let regexp = /\[carousel\]/;
        let result = body.match(regexp);

        return (
            result ? <React.Fragment>
                <section>{ReactParser(str.substr(0, result.index))}</section>
                {entity && id ? <Carousel entity={entity} id={id} {...props} /> : ``}
                <section>{ReactParser(str.substr(result.index + result[0].length, result.input.length))}</section>
            </React.Fragment> : ReactParser(body)

        )
    }

    return body ? parse(body) : ``;
}