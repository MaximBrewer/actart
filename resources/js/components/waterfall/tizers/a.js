
                if (data.entity == "lots" || data.entity == "favorites") {
                    return (
                        <div className={`lot-item`}>
                            <div className="image-holder">
                                <div
                                    className={`image`}
                                    style={{
                                        backgroundImage:
                                            "url(" + item.thumbnail + ")",
                                        paddingTop:
                                            (item.pxheight / item.pxwidth) *
                                                100 +
                                            "%"
                                    }}
                                >
                                    <a
                                        href="#"
                                        onClick={e => toFavorite(item.id, e)}
                                        className={
                                            favorites &&
                                            favorites.indexOf(item.id) > -1
                                                ? `favorite-link active`
                                                : `favorite-link`
                                        }
                                        style={{
                                            position: "absolute",
                                            top: ".5rem",
                                            right: ".5rem"
                                        }}
                                    >
                                        <svg
                                            width="22"
                                            height="22"
                                            viewBox="0 0 22 22"
                                            xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <circle cx="11" cy="11" r="10.5" />
                                            <path d="M11.007 7C4.16959 7 2.08566 11.8388 2 12.0451L4.14935 13.02C4.1914 12.9242 4.88293 11.3952 6.85005 10.3715C6.75156 10.7502 6.70181 11.1409 6.70209 11.5333C6.70127 12.1194 6.8112 12.7 7.02559 13.2418C7.23998 13.7836 7.55463 14.2759 7.95155 14.6908C8.34846 15.1056 8.81987 15.4348 9.3388 15.6594C9.85773 15.884 10.414 15.9998 10.9759 16H11.0335C12.1662 16.0009 13.2528 15.5326 14.0548 14.6981C14.8567 13.8637 15.3083 12.7312 15.3104 11.5496C15.3113 11.1658 15.2647 10.7835 15.1718 10.4122C17.1077 11.4472 17.8288 12.955 17.8709 13.046L20 12.0159C19.9112 11.8112 17.6933 7 11.007 7ZM13.4694 13.5969H10.75V10.7599H13.4694V13.5969Z" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <a
                                className="title"
                                href={
                                    data.author
                                        ? `/authors/` +
                                          data.author +
                                          `/lots/` +
                                          item.id
                                        : data.gallery
                                        ? data.archive
                                            ? `javascript:void(0)`
                                            : `/gallery/lot/` + item.id
                                        : `/auction/lot/`
                                }
                            >
                                {item.title}
                            </a>
                            <div className="d-flex justify-content-between">
                                <a className="author" href={item.author_url}>
                                    {item.author}
                                </a>
                                <div className="price">
                                    <svg
                                        viewBox="0 0 15 14"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                    >
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
                                    <span>
                                        $
                                        {item.bets.length
                                            ? item.bets[0].bet
                                            : item.price}
                                    </span>
                                </div>
                            </div>
                            <div className="matherial">
                                {item.materials.map((m, mi) => (
                                    <span key={mi}>{m.title}</span>
                                ))}
                            </div>
                            <div className="size">
                                {item.width} х {item.height}
                                {__("см")}
                            </div>
                            {data.lastbets || (
                                <a className={item.status + ` status`} href="#">
                                    {__("#status-" + item.status + "#")}
                                </a>
                            )}
                        </div>
                    );
                } else if (data.entity == "authors") {
                    return (
                        <div key={index} className="author-item">
                            <div
                                className="image"
                                style={{
                                    backgroundImage:
                                        "url(" + item.preview + ")",
                                    paddingTop:
                                        (item.pxheight / item.pxwidth) * 100 +
                                        "%"
                                }}
                            ></div>
                            <a className="title" href={`/authors/` + item.id}>
                                {item.name + ` ` + item.surname}
                            </a>
                        </div>
                    );
                } else if (data.entity == "events") {
                    return (
                        <a
                            className="event-wrapper"
                            key={index}
                            href={item.url}
                        >
                            <div className="event-inner">
                                <div
                                    className="image mb-4"
                                    style={{
                                        backgroundImage:
                                            "url(" + item[data.preview] + ")",
                                        paddingTop:
                                            (item.height / item.width) * 100 +
                                            "%"
                                    }}
                                ></div>
                                <div className="title">{item.title}</div>
                                <div className="subtitle">{item.excerpt}</div>
                                <div className="date">{item.dates}</div>
                                <div className="exhibit">
                                    {item.space.title}
                                </div>
                                <div className="address">
                                    {item.space.address}
                                </div>
                            </div>
                        </a>
                    );
                } else {
                    if (data.preview == "waterfall") {
                        return (
                            <div key={index} className="waterfall-item">
                                <div className="d-flex justify-content-between py-2 align-items-center">
                                    <div className="category">
                                        {item.category}
                                    </div>
                                    <div className="date">{item.date}</div>
                                </div>
                                <div
                                    className="image"
                                    style={{
                                        backgroundImage:
                                            "url(" + item[data.preview] + ")",
                                        paddingTop:
                                            (item.height / item.width) * 100 +
                                            "%"
                                    }}
                                ></div>
                                <div className="title">{item.title}</div>
                                <div className="excerpt">{item.excerpt}</div>
                                <div className="link">
                                    <a href={item.url}>{__("Читать дальше")}</a>
                                </div>
                            </div>
                        );
                    } else {
                        return (
                            <a
                                key={index}
                                className="waterfall-item"
                                href={item.url}
                            >
                                <div className="d-flex justify-content-between py-2 align-items-center">
                                    <div className="category">
                                        {item.category}
                                    </div>
                                    <div className="date">{item.date}</div>
                                </div>
                                <div
                                    className="image"
                                    style={{
                                        backgroundImage:
                                            "url(" + item[data.preview] + ")",
                                        paddingTop:
                                            (item.height / item.width) * 100 +
                                            "%"
                                    }}
                                ></div>
                                <div className="title">{item.title}</div>
                                <div className="announce">{item.excerpt}</div>
                            </a>
                        );
                    }
                }
            