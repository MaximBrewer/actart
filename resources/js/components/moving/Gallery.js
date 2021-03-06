import React, { useState, useEffect, useRef } from "react";
import __ from "../../utils/trans";
import { NavLink, Link, useHistory } from "react-router-dom";

const getRandomColor = () => {
    var letters = "0123456789ABCDEF";
    var color = "#";
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
};

const rows = 3;
const cols = 10;
const size = 250;
let position = 0;
let step = 2;

function Block(props) {
    const { size, auction } = props;
    return (
        <div
            key={props.index}
            className="gallery-body"
            style={{
                width: cols * size + "px",
                height: rows * size + "px"
            }}
        >
            {auction.lots.map((item, index) => (
                <div
                    className={"picture"}
                    key={index}
                    style={{
                        width: item.w * size + "px",
                        height: item.h * size + "px",
                        left: item.l * size + "px",
                        top: item.t * size + "px",
                        backgroundColor: item.bg,
                        backgroundImage: `url(${encodeURI(item.path)})`
                    }}
                >
                    <div className="picture-inner">
                        <Link
                            to={item.href}
                            target="_self"
                            className="lookFullSize"
                        >
                            <span className="ico-holder">
                                <span className="ia icon-logo-eye"></span>
                            </span>
                        </Link>
                        <div className="pic-description">
                            <div className="tag">{item.tag}</div>
                            <div className="title">{item.title}</div>
                        </div>
                    </div>
                </div>
            ))}
        </div>
    );
}

export default function Gallery() {
    const [blocks, setBlocks] = useState([]);
    const [state, setState] = useState({ auction: {} });

    const ref = useRef();
    const requestRef = useRef();

    const moveLeft = auction => {
        position -= step;
        let gals = document.getElementsByClassName("gallery-body");

        if (!gals.length || gals[0].offsetLeft + gals[0].offsetWidth <= 0) {
            setBlocks(prevState => {
                prevState.splice(0, 1);
                return prevState.concat(auction);
            });
            position = 0;
        }

        let i = 0;

        [].forEach.call(
            document.getElementsByClassName("gallery-body"),
            gal => {
                gal.style.left = position + size * cols * i + "px";
                i++;
            }
        );
    };

    const faster = () => {
        step = 2;
    };

    const slower = () => {
        step = 1;
    };

    useEffect(() => {
        if (window.App.toGallery) {
            let array = [];
            let grid = [];
            for (let i = 0; i < rows; i++) {
                grid[i] = [];
                for (let j = 0; j < cols; j++) {
                    grid[i][j] = 0;
                }
            }
            let i = 0;
            loop1: for (let lot of window.App.toGallery.lots) {
                ++i;
                let h = 1,
                    w = 1;
                if (lot.height > lot.width * 1.2) {
                    h = 2;
                } else if (lot.width > lot.height * 1.2) {
                    w = 2;
                }
                let p = {
                    h: h,
                    w: w,
                    title: lot.title,
                    path: lot.thumbnail,
                    l: 0,
                    t: 0,
                    bg: getRandomColor(),
                    href:
                        "/auctions/" +
                        window.App.toGallery.id +
                        "/lot/" +
                        lot.id
                };
                let set = false;
                loop2: for (let j in grid) {
                    j = j / 1;
                    for (let k in grid[j]) {
                        k = k / 1;
                        if (grid[j][k]) continue;

                        p.s = 1;
                        p.l = k;
                        p.t = j;

                        if (j == grid.length - 1) p.h = 1;
                        if (k == grid[j].length - 1) p.w = 1;
                        else if (grid[j][k + 1]) p.w = 1;

                        grid[j][k] = i + 1;
                        if (p.h > 1) {
                            grid[j + 1][k] = i + 1;
                        }
                        if (p.w > 1) {
                            grid[j][k] = i + 1;
                            grid[j][k + 1] = i + 1;
                            if (p.h > 1) {
                                grid[j + 1][k + 1] = i + 1;
                            }
                        }
                        set = true;
                        break loop2;
                    }
                }
                if (!set) break loop1;
                array.push(p);
            }
            let auction = { ...window.App.toGallery, lots: array };
            setState({ auction: auction });
            let w = document.body.clientWidth,
                c = Math.ceil(w / (size * cols)) + 2;
            c = c < 20 ? c : 20;

            let arr = [];
            for (; c > 0; c--) {
                arr.push(auction);
            }
            setBlocks(prevState => {
                return prevState.concat(arr);
            });

            requestRef.current = requestAnimationFrame(function i() {
                moveLeft(auction);
                requestRef.current = requestAnimationFrame(i);
            });

            ref.current.addEventListener("mouseenter", slower);
            ref.current.addEventListener("mouseleave", faster);
        }
        return () => {
            ref.current.removeEventListener("mouseenter", slower);
            ref.current.removeEventListener("mouseleave", faster);
            cancelAnimationFrame(requestRef.current);
        };
    }, []);

    return (
        <div className="gallery-holder" id="galleryHolder">
            <div className="container">
                <div className="row">
                    <div className="col-xs-6">
                        <div className="g-title">
                            <h5 className="h5">{__("#AUCTION_WORD#")}</h5>
                            <h1 className="h1">{state.auction.title}</h1>
                            <div className="sub_h2">
                                {__("#THE_BEST_VSEKO_LINK#")}
                            </div>
                            <a
                                className="h5_underline"
                                href={"/auctions/" + state.auction.id}
                            >
                                {__("#VIEW_LOTS_LINK#")} →
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div className="gallery-inner" ref={ref}>
                {blocks.map((auction, index) => (
                    <Block
                        key={index}
                        auction={auction}
                        cols={cols}
                        size={size}
                        rows={rows}
                    />
                ))}
            </div>
        </div>
    );
}
