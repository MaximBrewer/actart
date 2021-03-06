import ReactParser from "html-react-parser";
import React, { useState, useEffect, useRef } from "react";
import Carousel from "../components/Carousel";

export default function Parser(props) {
    const { body, entity = 0, id = 0 } = props;

    const parse = str => {
        let regex = /youtube.com/;
        let resul = str.match(regex);

        let regexp = /<iframe[^>]*><\/iframe>/;
        let result = str.match(regexp);

        let htmlstr = "";
        if (resul && result) {
            htmlstr += str.substr(0, result.index);
            htmlstr +=
                "<div class='row justify-content-xl-start'><div class='col-xl-42'><div style='padding-top:58.82%;height:0;position:relative;' class='translation-wrapper'>";
            htmlstr += result[0];
            htmlstr += "</div></div></div>";
            htmlstr += str.substr(
                result.index + result[0].length,
                result.input.length
            );
        } else htmlstr = str;

        regexp = /\[carousel\]/;
        result = htmlstr.match(regexp);

        return result ? (
            <React.Fragment>
                <section>
                    {ReactParser(htmlstr.substr(0, result.index) ?? "")}
                </section>
                {entity && id ? (
                    <Carousel entity={entity} id={id} {...props} />
                ) : (
                    ``
                )}
                <section>
                    {ReactParser(
                        htmlstr.substr(
                            result.index + result[0].length,
                            result.input.length
                        ) ?? ""
                    )}
                </section>
            </React.Fragment>
        ) : (
            ReactParser(htmlstr ?? "")
        );
    };

    return body ? parse(body) : ``;
}
