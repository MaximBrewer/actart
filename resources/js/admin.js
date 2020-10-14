window.addValue = inp => {
    var body =
        "value=" +
        encodeURIComponent(inp.value) +
        "&type=" +
        encodeURIComponent(inp.dataset.getItemsField) +
        "&method=" +
        encodeURIComponent(inp.dataset.method) +
        "&id=" +
        encodeURIComponent(inp.dataset.id);

    const request = new XMLHttpRequest();
    const url = inp.dataset.getItemsRoute;

    request.responseType = "json";
    request.open("PATCH", url, true);
    request.setRequestHeader(
        "Content-type",
        "application/x-www-form-urlencoded"
    );
    request.addEventListener("readystatechange", () => {
        if (request.readyState === 4 && request.status === 200) {
            let model = request.response;

            let h = document.createElement("LI"),
                has = document.createElement("SPAN"),
                ha = document.createElement("A"),
                hi = document.createElement("INPUT");
            hi.setAttribute("name", inp.dataset.getItemsField + "[]");
            hi.setAttribute("value", model.id);
            hi.setAttribute("type", "hidden");

            ha.innerText = "×";
            ha.setAttribute(
                "onclick",
                "this.parentNode.parentNode.removeChild(this.parentNode)"
            );
            ha.setAttribute("href", "javascript:void(0)");
            h.innerText = " " + model.title;
            h.prepend(ha);
            h.append(hi);

            inp.value = "";
            document
                .getElementById("list-" + inp.dataset.getItemsField)
                .appendChild(h);
        }
    });

    request.send(body);
};
window.autocomplete = inp => {
    var currentFocus;
    inp.addEventListener("input", function(e) {
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

        const request = new XMLHttpRequest();
        const url =
            inp.dataset.getItemsRoute +
            "?search=" +
            val +
            "&type=" +
            inp.dataset.getItemsField +
            "&method=" +
            inp.dataset.method +
            "&id=" +
            inp.dataset.id +
            "&page=1";
        request.responseType = "json";
        request.open("GET", url, true);
        request.setRequestHeader(
            "Content-type",
            "application/x-www-form-urlencoded"
        );
        request.addEventListener("readystatechange", () => {
            if (request.readyState === 4 && request.status === 200) {
                let obj = request.response;
                let arr = obj.results;

                for (i = 0; i < arr.length; i++) {
                    if (arr[i].text.indexOf(val) > -1) {
                        b = document.createElement("DIV");
                        b.innerHTML += arr[i].text;
                        b.dataset.id = arr[i].id;

                        b.addEventListener("click", function(e) {
                            let y = false;
                            [].forEach.call(
                                document.getElementsByName(
                                    inp.dataset.getItemsField + "[]"
                                ),
                                element => {
                                    if (element.value == e.target.dataset.id)
                                        y = true;
                                }
                            );
                            if (y) return false;

                            let h = document.createElement("LI"),
                                has = document.createElement("SPAN"),
                                ha = document.createElement("A"),
                                hi = document.createElement("INPUT");
                            hi.setAttribute(
                                "name",
                                inp.dataset.getItemsField + "[]"
                            );
                            hi.setAttribute("value", e.target.dataset.id);
                            hi.setAttribute("type", "hidden");

                            ha.innerText = "×";
                            ha.setAttribute(
                                "onclick",
                                "this.parentNode.parentNode.removeChild(this.parentNode)"
                            );
                            ha.setAttribute("href", "javascript:void(0)");
                            h.innerText = " " + e.target.innerText;
                            h.prepend(ha);
                            h.append(hi);

                            inp.value = "";
                            document
                                .getElementById(
                                    "list-" + inp.dataset.getItemsField
                                )
                                .appendChild(h);
                            closeAllLists();
                        });
                        a.appendChild(b);
                    }
                }
            }
        });

        request.send();
    });
    inp.addEventListener("keydown", function(e) {
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
    document.addEventListener("click", function(e) {
        closeAllLists(e.target);
    });
};
document.addEventListener("DOMContentLoaded", function() {
    [].forEach.call(
        document.getElementsByClassName("autocomplete-ajax"),
        inp => {
            autocomplete(inp);
        }
    );
});
