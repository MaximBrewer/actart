!function(e){var t={};function n(a){if(t[a])return t[a].exports;var o=t[a]={i:a,l:!1,exports:{}};return e[a].call(o.exports,o,o.exports,n),o.l=!0,o.exports}n.m=e,n.c=t,n.d=function(e,t,a){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:a})},n.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var a=Object.create(null);if(n.r(a),Object.defineProperty(a,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var o in e)n.d(a,o,function(t){return e[t]}.bind(null,o));return a},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="/",n(n.s=37)}({100:function(e,t){},105:function(e,t){},37:function(e,t,n){n(38),n(100),e.exports=n(105)},38:function(e,t){window.addValue=function(e){var t="value="+encodeURIComponent(e.value)+"&type="+encodeURIComponent(e.dataset.getItemsField)+"&method="+encodeURIComponent(e.dataset.method)+"&id="+encodeURIComponent(e.dataset.id),n=new XMLHttpRequest,a=e.dataset.getItemsRoute;n.responseType="json",n.open("PATCH",a,!0),n.setRequestHeader("Content-type","application/x-www-form-urlencoded"),n.addEventListener("readystatechange",(function(){if(4===n.readyState&&200===n.status){var t=n.response,a=document.createElement("LI"),o=(document.createElement("SPAN"),document.createElement("A")),d=document.createElement("INPUT");d.setAttribute("name",e.dataset.getItemsField+"[]"),d.setAttribute("value",t.id),d.setAttribute("type","hidden"),o.innerText="×",o.setAttribute("onclick","this.parentNode.parentNode.removeChild(this.parentNode)"),o.setAttribute("href","javascript:void(0)"),a.innerText=" "+t.title,a.prepend(o),a.append(d),e.value="",document.getElementById("list-"+e.dataset.getItemsField).appendChild(a)}})),n.send(t)},window.autocomplete=function(e){var t;function n(e){if(!e)return!1;!function(e){for(var t=0;t<e.length;t++)e[t].classList.remove("autocomplete-active")}(e),t>=e.length&&(t=0),t<0&&(t=e.length-1),e[t].classList.add("autocomplete-active")}function a(t){for(var n=document.getElementsByClassName("autocomplete-items"),a=0;a<n.length;a++)t!=n[a]&&t!=e&&n[a].parentNode.removeChild(n[a])}e.addEventListener("input",(function(n){var o,d,r,i=this.value;if(a(),!i)return!1;t=-1,(o=document.createElement("DIV")).setAttribute("id",this.id+"autocomplete-list"),o.setAttribute("class","autocomplete-items"),this.parentNode.appendChild(o);var u=new XMLHttpRequest,s=e.dataset.getItemsRoute+"?search="+i+"&type="+e.dataset.getItemsField+"&method="+e.dataset.method+"&id="+e.dataset.id+"&page=1";u.responseType="json",u.open("GET",s,!0),u.setRequestHeader("Content-type","application/x-www-form-urlencoded"),u.addEventListener("readystatechange",(function(){if(4===u.readyState&&200===u.status){var t=u.response.results;for(r=0;r<t.length;r++)t[r].text.indexOf(i)>-1&&((d=document.createElement("DIV")).innerHTML+=t[r].text,d.dataset.id=t[r].id,d.addEventListener("click",(function(t){var n=!1;if([].forEach.call(document.getElementsByName(e.dataset.getItemsField+"[]"),(function(e){e.value==t.target.dataset.id&&(n=!0)})),n)return!1;var o=document.createElement("LI"),d=(document.createElement("SPAN"),document.createElement("A")),r=document.createElement("INPUT");r.setAttribute("name",e.dataset.getItemsField+"[]"),r.setAttribute("value",t.target.dataset.id),r.setAttribute("type","hidden"),d.innerText="×",d.setAttribute("onclick","this.parentNode.parentNode.removeChild(this.parentNode)"),d.setAttribute("href","javascript:void(0)"),o.innerText=" "+t.target.innerText,o.prepend(d),o.append(r),e.value="",document.getElementById("list-"+e.dataset.getItemsField).appendChild(o),a()})),o.appendChild(d))}})),u.send()})),e.addEventListener("keydown",(function(e){var a=document.getElementById(this.id+"autocomplete-list");a&&(a=a.getElementsByTagName("div")),40==e.keyCode?(t++,n(a)):38==e.keyCode?(t--,n(a)):13==e.keyCode&&(e.preventDefault(),t>-1&&a&&a[t].click())})),document.addEventListener("click",(function(e){a(e.target)}))},document.addEventListener("DOMContentLoaded",(function(){[].forEach.call(document.getElementsByClassName("autocomplete-ajax"),(function(e){autocomplete(e)}))}))}});