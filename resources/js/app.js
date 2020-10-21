import React from 'react';
import ReactDOM from 'react-dom';
// import Echo from "laravel-echo";
// window.Pusher = require('pusher-js');
import axios from "axios";
import Flash from "./helpers/Flash";
window.axios = axios;
window.grid = {
  xs: 576,
  sm: 768,
  md: 992,
  lg: 1280,
  xl: 1440,
  xxl: 100000
};

// window.Echo = new Echo({
//   broadcaster: 'pusher',
//   key: 'c3601b3f39bca77b9879'
// });

// window.io = require("socket.io-client");
// if (typeof io !== "undefined") {
//   window.Echo = new Echo({
//     broadcaster: "socket.io",
//     host: window.location.hostname + ":6001",
//     headers: {
//       "X-CSRF-TOKEN": document.getElementsByName("csrf-token").content
//     }
//   });
// window.Echo.channel("Auction").listen("Auction", function (e) {
//   window.dispatchEvent(
//     new CustomEvent("auction", {
//       detail: {
//         auction: e.auction
//       }
//     })
//   );
// });
// window.Echo.channel("Lot").listen("Lot", function (e) {
//   window.dispatchEvent(
//     new CustomEvent("lot", {
//       detail: {
//         lot: e.lot
//       }
//     })
//   );
// });
// }


// Enable pusher logging - don't include this in production
// Pusher.logToConsole = true;

var pusher = new Pusher('c3601b3f39bca77b9879', {
  cluster: 'eu'
});

var channel = pusher.subscribe('act-art');
channel.bind('update-lot', function (data) {
  let g = [];
  for (let i in window.App.gallery)
    if (window.App.gallery[i].id == data.lot.id) g.push(data.lot);
    else g.push(window.App.gallery[i]);
  window.App.gallery = g;
  window.dispatchEvent(
    new CustomEvent("update-lot", {
      detail: {
        lot: data.lot
      }
    })
  );
});

channel.bind('remove-lot', function (data) {
  let g = [];
  for (let i in window.App.gallery)
    if (window.App.gallery[i].id == data.id) { }
    else g.push(window.App.gallery[i]);
  window.App.gallery = g;
  window.dispatchEvent(
    new CustomEvent("remove-lot", {
      detail: {
        id: data.id
      }
    })
  );
});

channel.bind('update-translation', function (data) {
  window.App.translation = data.translation;
  window.dispatchEvent(
    new CustomEvent("update-translation", {
      detail: {
        translation: data.translation
      }
    })
  );
});

channel.bind('update-auction', function (data) {
  console.log(data.auction)
  window.dispatchEvent(
    new CustomEvent("update-auction", {
      detail: {
        auction: data.auction
      }
    })
  );
});


import App from './router';
import { AuthProvider } from './context/auth';


ReactDOM.render(
  <AuthProvider>
    <App />
  </AuthProvider>,
  document.getElementById('app')
);

ReactDOM.render(<Flash />, document.getElementById("flashHolder"));

function changeWindow() {

  let stickies = document.getElementsByClassName("sticky-section");
  let bgts = document.getElementsByClassName("background-text");

  if (window.innerWidth > 1279) {
    [].forEach.call(stickies, function (sticky) {
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
    [].forEach.call(bgts, function (bgt) {
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
    [].forEach.call(stickies, function (sticky) {
      sticky.style.display = "none";
    });
  }
}
document.addEventListener("scroll", () => changeWindow());
window.addEventListener("resize", () => changeWindow());