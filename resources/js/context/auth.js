import React, { useState, useEffect, useMemo } from "react";
import PropTypes from "prop-types";
import { getToken, setToken } from "../utils/auth";
import { getUser } from "../api/auth";

const AuthContext = React.createContext();

AuthProvider.propTypes = {
    children: PropTypes.element.isRequired
};

function AuthProvider({ children }) {
    const [initializing, setInitializing] = useState(true);
    const [currentUser, setCurrentUser] = useState(null);
    const authenticated = useMemo(() => !!currentUser, [currentUser]);
    const administration = useMemo(
        () => !!currentUser && !!currentUser.role.id == 1,
        [currentUser]
    );

    const inAuctions = id => {
        if (currentUser)
            for (const a of currentUser.auctions) if (a.id == id) return true;
        return false;
    };

    const initAuth = () => {
        return getToken() ? getUser() : Promise.resolve(null);
    };

    useEffect(() => {
        initAuth().then(user => {
            setCurrentUser(user);
            setInitializing(false);
        });
    }, []);

    return (
        <AuthContext.Provider
            value={{
                initializing,
                authenticated,
                currentUser,
                administration,
                setToken,
                inAuctions,
                setCurrentUser
            }}
        >
            {" "}
            {children}
        </AuthContext.Provider>
    );
}

function useAuth() {
    const context = React.useContext(AuthContext);

    if (context === undefined) {
        throw new Error(`useAuth must be used within a AuthProvider`);
    }

    return context;
}

export { AuthProvider, useAuth };
