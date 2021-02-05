import "babel-polyfill";
import React from "react";
import ReactDOM from "react-dom";
import axios from "axios";
import Flash from "./helpers/Flash";
import { polyfill } from "es6-promise";
import "react-image-lightbox/style.css";
import client from "./api/client";
polyfill();

import "react-app-polyfill/ie11";
import "react-app-polyfill/stable";

/*! https://mths.be/scrollingelement v1.5.2 by @diegoperini & @mathias | MIT license */
if (!("scrollingElement" in document))
    (function() {
        function computeStyle(element) {
            if (window.getComputedStyle) {
                // Support Firefox < 4 which throws on a single parameter.
                return getComputedStyle(element, null);
            }
            // Support Internet Explorer < 9.
            return element.currentStyle;
        }

        function isBodyElement(element) {
            // The `instanceof` check gives the correct result for e.g. `body` in a
            // non-HTML namespace.
            if (window.HTMLBodyElement) {
                return element instanceof HTMLBodyElement;
            }
            // Fall back to a `tagName` check for old browsers.
            return /body/i.test(element.tagName);
        }

        function getNextBodyElement(frameset) {
            // We use this function to be correct per spec in case `document.body` is
            // a `frameset` but there exists a later `body`. Since `document.body` is
            // a `frameset`, we know the root is an `html`, and there was no `body`
            // before the `frameset`, so we just need to look at siblings after the
            // `frameset`.
            var current = frameset;
            while ((current = current.nextSibling)) {
                if (current.nodeType == 1 && isBodyElement(current)) {
                    return current;
                }
            }
            // No `body` found.
            return null;
        }

        // Note: standards mode / quirks mode can be toggled at runtime via
        // `document.write`.
        var isCompliantCached;
        var isCompliant = function() {
            var isStandardsMode = /^CSS1/.test(document.compatMode);
            if (!isStandardsMode) {
                // In quirks mode, the result is equivalent to the non-compliant
                // standards mode behavior.
                return false;
            }
            if (isCompliantCached === void 0) {
                // When called for the first time, check whether the browser is
                // standard-compliant, and cache the result.
                var iframe = document.createElement("iframe");
                iframe.style.height = "1px";
                (
                    document.body ||
                    document.documentElement ||
                    document
                ).appendChild(iframe);
                var doc = iframe.contentWindow.document;
                doc.write('<!DOCTYPE html><div style="height:9999em">x</div>');
                doc.close();
                isCompliantCached =
                    doc.documentElement.scrollHeight > doc.body.scrollHeight;
                iframe.parentNode.removeChild(iframe);
            }
            return isCompliantCached;
        };

        function isRendered(style) {
            return (
                style.display != "none" &&
                !(
                    style.visibility == "collapse" &&
                    /^table-(.+-group|row|column)$/.test(style.display)
                )
            );
        }

        function isScrollable(body) {
            // A `body` element is scrollable if `body` and `html` both have
            // non-`visible` overflow and are both being rendered.
            var bodyStyle = computeStyle(body);
            var htmlStyle = computeStyle(document.documentElement);
            return (
                bodyStyle.overflow != "visible" &&
                htmlStyle.overflow != "visible" &&
                isRendered(bodyStyle) &&
                isRendered(htmlStyle)
            );
        }

        var scrollingElement = function() {
            if (isCompliant()) {
                return document.documentElement;
            }
            var body = document.body;
            // Note: `document.body` could be a `frameset` element, or `null`.
            // `tagName` is uppercase in HTML, but lowercase in XML.
            var isFrameset = body && !/body/i.test(body.tagName);
            body = isFrameset ? getNextBodyElement(body) : body;
            // If `body` is itself scrollable, it is not the `scrollingElement`.
            return body && isScrollable(body) ? null : body;
        };

        if (Object.defineProperty) {
            // Support modern browsers that lack a native implementation.
            Object.defineProperty(document, "scrollingElement", {
                get: scrollingElement
            });
        } else if (document.__defineGetter__) {
            // Support Firefox ≤ 3.6.9, Safari ≤ 4.1.3.
            document.__defineGetter__("scrollingElement", scrollingElement);
        } else {
            // IE ≤ 4 lacks `attachEvent`, so it only gets this one assignment. IE ≤ 7
            // gets it too, but the value is updated later (see `propertychange`).
            document.scrollingElement = scrollingElement();
            document.attachEvent &&
                document.attachEvent("onpropertychange", function() {
                    // This is for IE ≤ 7 only.
                    // A `propertychange` event fires when `<body>` is parsed because
                    // `document.activeElement` then changes.
                    if (window.event.propertyName == "activeElement") {
                        document.scrollingElement = scrollingElement();
                    }
                });
        }
    })();

if (typeof Object.assign != "function") {
    console.log("Object.assign");
    Object.assign = function(target) {
        "use strict";
        if (target == null) {
            throw new TypeError("Cannot convert undefined or null to object");
        }

        target = Object(target);
        for (var index = 1; index < arguments.length; index++) {
            var source = arguments[index];
            if (source != null) {
                for (var key in source) {
                    if (Object.prototype.hasOwnProperty.call(source, key)) {
                        target[key] = source[key];
                    }
                }
            }
        }
        return target;
    };
}

window.axios = axios;
window.skipScroll = false;
window.grid = {
    xs: 576,
    sm: 768,
    md: 992,
    lg: 1280,
    xl: 1440,
    xxl: 100000
};

var pusher = new Pusher("9681c44bc120601864d3", {
    cluster: "eu"
});

var channel = pusher.subscribe("act-art");

channel.bind("update-translation", function({ translation }) {
    window.App.translation = translation;
    window.dispatchEvent(
        new CustomEvent("update-translation", {
            detail: {
                translation: translation
            }
        })
    );
});

channel.bind("remove-lot", function({ id }) {
    let g = [];
    for (let i in window.App.gallery)
        window.App.gallery[i].id == id || g.push(window.App.gallery[i]);
    window.App.gallery = g;
    window.dispatchEvent(
        new CustomEvent("remove-lot", {
            detail: {
                id: id
            }
        })
    );
});

channel.bind("remove-bet", function({ id }) {
    let g = [];
    for (let lot of window.App.gallery) {
        let bets = [];
        for (let bet of lot.bets) bet.id == id || bets.push(bet);
        lot.bets = bets;
        g.push(lot);
    }
    window.App.gallery = g;
    window.dispatchEvent(
        new CustomEvent("remove-bet", {
            detail: {
                id: id
            }
        })
    );
});

channel.bind("create-bet", function({ bet }) {
    window.dispatchEvent(
        new CustomEvent("create-bet", {
            detail: {
                bet: bet
            }
        })
    );
});
channel.bind("update-countdown", function({ id, countdown, delta }) {
    let event = new CustomEvent("update-countdown", {
        detail: { id: id, countdown: countdown, delta: delta }
    });
    window.dispatchEvent(event);
});

channel.bind("update-lot-status", function({ id, status }) {
    let g = [];
    for (let i in window.App.gallery) {
        let lot = window.App.gallery[i];
        lot.id == id && (lot.status = status);
        g.push(lot);
    }
    window.App.gallery = g;
    window.dispatchEvent(
        new CustomEvent("update-lot-status", {
            detail: { id, status }
        })
    );
});

channel.bind("update-lot-lastchance", function({ id, lastchance }) {
    let g = [];
    for (let i in window.App.gallery) {
        let lot = window.App.gallery[i];
        lot.id == id && (lot.lastchance = lastchance);
        g.push(lot);
    }
    window.App.gallery = g;
    window.dispatchEvent(
        new CustomEvent("update-lot-lastchance", {
            detail: { id, lastchance }
        })
    );
});

const req = (url, method = "GET", body = null) => {
    return new Promise(function(resolve, reject) {
        client(url, {
            method: method,
            body: body
        })
            .then(resp => resolve(resp))
            .catch(err => reject(err));
    });
};

channel.bind("update-auction-status", function({ id, status }) {
    let coming = [],
        exists = false;

    for (let a of window.App.coming) {
        if (id == a.id) {
            if (status == "started" || status == "coming") {
                coming.push(a);
                exists = true;
            }
        } else {
            coming.push(a);
        }
    }

    if (!exists) {
        req("/api/" + window.App.locale + "/auctions/" + id)
            .then(({ auction }) => {
                coming.push(auction);
            })
            .catch(err => console.log(err));
    }

    window.App.coming = coming;

    window.dispatchEvent(
        new CustomEvent("update-auction-status", {
            detail: { id, status }
        })
    );
});

channel.bind("update-auction-seeders", function({ id, seeders }) {
    window.dispatchEvent(
        new CustomEvent("update-auction-seeders", {
            detail: { id, seeders }
        })
    );
});

import App from "./router";
import { AuthProvider } from "./context/auth";

window.initState = {
    login: false,
    register: false,
    forgot: false,
    reset: false,
    confirmation: false
};

import { transitions, positions, Provider as AlertProvider } from "react-alert";
import AlertTemplate from "./components/react-alert-template-basic";

// optional configuration
const options = {
    // you can also just use 'bottom center'
    position: positions.BOTTOM_CENTER,
    timeout: 3000,
    offset: "1rem",
    // you can also just use 'scale'
    transition: transitions.SCALE
};

ReactDOM.render(
    <AuthProvider>
        <AlertProvider template={AlertTemplate} {...options}>
            <App />
        </AlertProvider>
    </AuthProvider>,
    document.getElementById("app")
);

ReactDOM.render(<Flash />, document.getElementById("flashHolder"));

function changeWindow() {
    let stickies = document.getElementsByClassName("sticky-section");
    let bgts = document.getElementsByClassName("background-text");

    if (window.innerWidth > 1279) {
        [].forEach.call(stickies, function(sticky) {
            sticky.style.display = "flex";
            let c = sticky.parentNode,
                sp = sticky.children[0],
                egr = c.getBoundingClientRect();
            if (egr.top < 80) {
                if (egr.top + egr.height > 80 + sp.offsetWidth) {
                    sticky.style.position = "fixed";
                    sticky.style.top = 80 + "px";
                    sticky.style.bottom = "auto";
                } else {
                    sticky.style.marginLeft = "0";
                    sticky.style.top = "auto";
                    sticky.style.bottom = sp.offsetWidth - 24 + "px";
                    sticky.style.position = "absolute";
                }
            } else {
                sticky.style.marginLeft = "0";
                sticky.style.top = "0";
                sticky.style.bottom = "auto";
                sticky.style.position = "absolute";
            }
        });
        [].forEach.call(bgts, function(bgt) {
            bgt.style.display = "block";
            let egr = bgt.getBoundingClientRect();
            if (egr.top < 500) {
                if (egr.top > 100) {
                    bgt.style.transform =
                        "translateX(" + ((egr.top - 100) * 80) / 400 + "%)";
                } else {
                    bgt.style.transform = "translateX(0%)";
                }
            } else {
                bgt.style.transform = "translateX(80%)";
            }
        });
    } else {
        [].forEach.call(stickies, function(sticky) {
            sticky.style.display = "none";
        });
    }
}
document.addEventListener("scroll", () => changeWindow());
window.addEventListener("resize", () => changeWindow());
