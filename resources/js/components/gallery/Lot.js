import React, { useEffect, useState } from "react";
import Waterfall from "../waterfall/Waterfall";
import { Link, useParams, useHistory } from "react-router-dom";
import Carousel from "./carousel/Carousel";
import __ from "../../utils/trans";

export default function Lot(props) {
    const [state, setstate] = useState({
        carousel: <Carousel {...props} />,
        items: props.items
    });

    const updateLotStatus = event => {
        setstate(prevState => ({
            ...prevState,
            carousel: ""
        }));
        setstate(prevState => {
            let newItems = [];
            for (let item of prevState.items) {
                if (
                    event.detail.id != item.id ||
                    event.detail.status == "gallery"
                ) {
                    newItems.push(item);
                }
            }
            return {
                carousel: <Carousel {...props} items={newItems} />,
                items: newItems
            };
        });
    };


    useEffect(() => {
        window.addEventListener("update-lot-status", updateLotStatus);
        return () => {
            window.removeEventListener("update-lot-status", updateLotStatus);
        };
    }, []);

    // useEffect(setCarousel(<Carousel {...props} items={items} />), [items]);

    return (
        <section className="lot-section">
            <div className="sticky-wrapper">
                <div className="container">
                    {state.carousel}
                    <div className="gallery-works" id="galleryWorksList">
                        <div className="h2">{__("Works for sale")}</div>
                        <div className="gallery-works-list">
                            <Waterfall
                                {...props}
                                data={{
                                    sortable: true,
                                    gallery: true,
                                    tizerView: "gallery",
                                    view: {
                                        xs: 1,
                                        sm: 2,
                                        md: 2,
                                        lg: 3,
                                        xl: 4,
                                        xxl: 4
                                    }
                                }}
                            />
                            <div className="text-center my-2">
                                <Link to="/gallery" className="btn btn-default">
                                    {__("BTN_BACK_TO_GALLERY")}
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="sticky-section">
                    <span>{__("works for sale")}</span>
                </div>
            </div>
        </section>
    );
}
