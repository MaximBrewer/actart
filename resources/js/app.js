import React from 'react';
import ReactDOM from 'react-dom';
import Echo from "laravel-echo";
import axios from "axios";
window.axios = axios;
window.grid = {
    xs: 576,
    sm: 768,
    md: 992,
    lg: 1280,
    xl: 1440,
    xxl: 100000
};
// window.io = require("socket.io-client");
// if (typeof io !== "undefined") {
//     window.Echo = new Echo({
//         broadcaster: "socket.io",
//         host: window.location.hostname + ":6001",
//         headers: {
//             "X-CSRF-TOKEN": document.getElementsByName("csrf-token").content
//         }
//     });
// }

// window.Echo.channel("Auction").listen("Auction", function(e) {
//     window.dispatchEvent(
//         new CustomEvent("auction", {
//             detail: {
//                 auction: e.auction
//             }
//         })
//     );
// });

// window.Echo.channel("Lot").listen("Lot", function(e) {
//     window.dispatchEvent(
//         new CustomEvent("lot", {
//             detail: {
//                 lot: e.lot
//             }
//         })
//     );
// });

import App from './router';
import { AuthProvider } from './context/auth';

ReactDOM.render(
  <AuthProvider>
    <App />
  </AuthProvider>,
  document.getElementById('app')
);
