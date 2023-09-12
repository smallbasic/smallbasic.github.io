function copyText(code, text) {
  return function() {
    navigator.clipboard.writeText(text);
    var color = code.style.borderColor;
    code.style.borderColor = "#a2a9b1";
    window.setTimeout(function() {
      code.style.borderColor = color;
    }, 250);
  }
}

window.onload = function() {
  for (var code of document.getElementsByTagName("pre")) {
    var button = document.createElement('button');
    var text = document.createElement("span");
    text.innerHTML = "&#x1F4CB;";
    button.appendChild(text);
    button.style.float="right";
    button.style.border="0";
    button.title = "Copy to clipboard";
    button.onclick = copyText(code, code.childNodes[0].innerText);
    code.insertBefore(button, code.childNodes[0]);
  }
}
