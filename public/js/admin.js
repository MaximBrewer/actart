/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./resources/js/admin.js":
/*!*******************************!*\
  !*** ./resources/js/admin.js ***!
  \*******************************/
/*! no static exports found */
/***/ (function(module, exports) {

window.addValue = function (inp) {
  var body = "value=" + encodeURIComponent(inp.value) + "&type=" + encodeURIComponent(inp.dataset.getItemsField) + "&method=" + encodeURIComponent(inp.dataset.method) + "&id=" + encodeURIComponent(inp.dataset.id);
  var request = new XMLHttpRequest();
  var url = inp.dataset.getItemsRoute;
  request.responseType = "json";
  request.open("PATCH", url, true);
  request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  request.addEventListener("readystatechange", function () {
    if (request.readyState === 4 && request.status === 200) {
      var model = request.response;
      var h = document.createElement("LI"),
          has = document.createElement("SPAN"),
          ha = document.createElement("A"),
          hi = document.createElement("INPUT");
      hi.setAttribute("name", inp.dataset.getItemsField + "[]");
      hi.setAttribute("value", model.id);
      hi.setAttribute("type", "hidden");
      ha.innerText = "×";
      ha.setAttribute("onclick", "this.parentNode.parentNode.removeChild(this.parentNode)");
      ha.setAttribute("href", "javascript:void(0)");
      h.innerText = " " + model.title;
      h.prepend(ha);
      h.append(hi);
      inp.value = "";
      document.getElementById("list-" + inp.dataset.getItemsField).appendChild(h);
    }
  });
  request.send(body);
};

window.autocomplete = function (inp) {
  var currentFocus;
  inp.addEventListener("input", function (e) {
    var a,
        b,
        i,
        val = this.value;
    closeAllLists();

    if (!val) {
      return false;
    }

    currentFocus = -1;
    a = document.createElement("DIV");
    a.setAttribute("id", this.id + "autocomplete-list");
    a.setAttribute("class", "autocomplete-items");
    this.parentNode.appendChild(a);
    var request = new XMLHttpRequest();
    var url = inp.dataset.getItemsRoute + "?search=" + val + "&type=" + inp.dataset.getItemsField + "&method=" + inp.dataset.method + "&id=" + inp.dataset.id + "&page=1";
    request.responseType = "json";
    request.open("GET", url, true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.addEventListener("readystatechange", function () {
      if (request.readyState === 4 && request.status === 200) {
        var obj = request.response;
        var arr = obj.results;

        for (i = 0; i < arr.length; i++) {
          if (arr[i].text.indexOf(val) > -1) {
            b = document.createElement("DIV");
            b.innerHTML += arr[i].text;
            b.dataset.id = arr[i].id;
            b.addEventListener("click", function (e) {
              var y = false;
              [].forEach.call(document.getElementsByName(inp.dataset.getItemsField + "[]"), function (element) {
                if (element.value == e.target.dataset.id) y = true;
              });
              if (y) return false;
              var h = document.createElement("LI"),
                  has = document.createElement("SPAN"),
                  ha = document.createElement("A"),
                  hi = document.createElement("INPUT");
              hi.setAttribute("name", inp.dataset.getItemsField + "[]");
              hi.setAttribute("value", e.target.dataset.id);
              hi.setAttribute("type", "hidden");
              ha.innerText = "×";
              ha.setAttribute("onclick", "this.parentNode.parentNode.removeChild(this.parentNode)");
              ha.setAttribute("href", "javascript:void(0)");
              h.innerText = " " + e.target.innerText;
              h.prepend(ha);
              h.append(hi);
              inp.value = "";
              document.getElementById("list-" + inp.dataset.getItemsField).appendChild(h);
              closeAllLists();
            });
            a.appendChild(b);
          }
        }
      }
    });
    request.send();
  });
  inp.addEventListener("keydown", function (e) {
    var x = document.getElementById(this.id + "autocomplete-list");
    if (x) x = x.getElementsByTagName("div");

    if (e.keyCode == 40) {
      currentFocus++;
      addActive(x);
    } else if (e.keyCode == 38) {
      currentFocus--;
      addActive(x);
    } else if (e.keyCode == 13) {
      e.preventDefault();

      if (currentFocus > -1) {
        if (x) x[currentFocus].click();
      }
    }
  });

  function addActive(x) {
    if (!x) return false;
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = x.length - 1;
    x[currentFocus].classList.add("autocomplete-active");
  }

  function removeActive(x) {
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }

  function closeAllLists(elmnt) {
    var x = document.getElementsByClassName("autocomplete-items");

    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }

  document.addEventListener("click", function (e) {
    closeAllLists(e.target);
  });
};

document.addEventListener("DOMContentLoaded", function () {
  [].forEach.call(document.getElementsByClassName("autocomplete-ajax"), function (inp) {
    autocomplete(inp);
  });
});

/***/ }),

/***/ "./resources/sass/admin.scss":
/*!***********************************!*\
  !*** ./resources/sass/admin.scss ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),

/***/ "./resources/sass/app.scss":
/*!*********************************!*\
  !*** ./resources/sass/app.scss ***!
  \*********************************/
/*! no static exports found */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),

/***/ 0:
/*!*******************************************************************************************!*\
  !*** multi ./resources/js/admin.js ./resources/sass/admin.scss ./resources/sass/app.scss ***!
  \*******************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! /Users/maxim/Projects/actart/resources/js/admin.js */"./resources/js/admin.js");
__webpack_require__(/*! /Users/maxim/Projects/actart/resources/sass/admin.scss */"./resources/sass/admin.scss");
module.exports = __webpack_require__(/*! /Users/maxim/Projects/actart/resources/sass/app.scss */"./resources/sass/app.scss");


/***/ })

/******/ });