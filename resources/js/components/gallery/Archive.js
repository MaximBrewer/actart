import React from "react";
import WaterfallAjax from "../waterfall/WaterfallAjax";
import __ from '../../utils/trans';
import useDocumentTitle from '../../components/document-title';

export default function Archive(props) {
    useDocumentTitle(__('GALLERY_ARCHIVE_PAGE_TITLE'));
    return (
        <div className="sticky-wrapper">
            <section className="gallery-section">
                <div id="appGallery"></div>
                <div className="background-text">{__("ARCHIVE_GALLERY_BG")}</div>
                <div className="container">
                    <div className="row announce mb-5">
                        <div className="col col-xl-40 col-xxl-38">
                            <h2 className="h1">{__("GALLERY_ARCHIVE_H2")}</h2>
                        </div>
                    </div>
                    <div className="gallery-works" id="galleryWorksList">
                        <div className="gallery-works-list">
                            <WaterfallAjax
                                data={{
                                    entity: "lots",
                                    action: "add",
                                    sortable: true,
                                    archive: true,
                                    gallery: true,
                                    tizerView: "gallery",
                                    limit: {
                                        xs: 12,
                                        sm: 12,
                                        md: 12,
                                        lg: 12,
                                        xl: 12,
                                        xxl: 12
                                    },
                                    view: {
                                        xs: 2,
                                        sm: 2,
                                        md: 2,
                                        lg: 2,
                                        xl: 3,
                                        xxl: 3
                                    }
                                }}
                            />
                        </div>
                    </div>
                </div>
            </section>
            <div className="sticky-section">
                <span>{__("ARCHIVE_OF_GALLERY")}</span>
            </div>
        </div>
    );
}
