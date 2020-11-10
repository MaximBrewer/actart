import React, { useState, useEffect, useRef } from "react";
import { Link, useHistory } from "react-router-dom";
import { useAuth } from "../context/auth";
import __ from "../utils/trans";
import { setIntendedUrl } from "../utils/auth";
import AuctionsProfile from "../components/auction/AuctionsProfile";
import Waterfall from "../components/waterfall/Waterfall";
import useDocumentTitle from "../components/document-title";

function Profile(props) {
    let { setCurrentUser, setToken, currentUser } = useAuth();
    useDocumentTitle(
        currentUser.surname +
            " " +
            currentUser.name +
            " " +
            currentUser.middlename
    );

    let history = useHistory();

    const handleLogout = () => {
        setCurrentUser(null);
        setToken(null);
        history.push("/");
        setIntendedUrl(null);
    };

    console.log(window.App.coming);

    return (
        <section className="profile-section">
            <div className="container">
                <div className="row announce">
                    <div className="col col-xl-40 col-xxl-38">
                        <h5 className="h5">
                            {__("You wanted to take part in the auctions:")}
                        </h5>
                        <AuctionsProfile />
                    </div>
                    <div className="col col-xl-20 col-xxl-22">
                        <h5 className="h5">{__("Profile data")}</h5>
                        <hr />
                        <dl>
                            <dt>{__("Your ID:")}</dt>
                            <dd>#{currentUser.id}</dd>
                        </dl>
                        <dl>
                            <dt>{__("Status:")}</dt>
                            <dd>{__(currentUser.role.display_name)}</dd>
                        </dl>
                        <dl>
                            <dt>{__("Full name:")}</dt>
                            <dd>
                                {currentUser.name +
                                    (currentUser.surname
                                        ? ` ` + currentUser.surname
                                        : ``)}
                            </dd>
                        </dl>
                        <dl>
                            <dt>{__("Логин:")}</dt>
                            <dd>{currentUser.email}</dd>
                        </dl>
                        <hr />
                        <div>
                            <Link to="/profile/vip">{__("WANTED_VIP")}</Link>
                        </div>
                        <hr />
                        <div onClick={handleLogout}>
                            <Link to="/">Logout</Link>
                        </div>
                        {currentUser.role.id == 1 ? (
                            <React.Fragment>
                                <hr />
                                <div>
                                    {window.App.coming.map((item, index) => (
                                        <Link to={`/auctions/admin/` + item.id}>
                                            {item.title}
                                        </Link>
                                    ))}
                                </div>
                            </React.Fragment>
                        ) : (
                            ``
                        )}
                    </div>
                </div>
                <div className="art-waterfall-wrapper py-5">
                    <h5 className="h5">{__("Favorites:")}</h5>
                    <div className="act-waterfall">
                        <Waterfall
                            {...props}
                            items={currentUser.favorites}
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
                    </div>
                </div>
            </div>
        </section>
    );
}

export default Profile;
