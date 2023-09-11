document.addEventListener("turbolinks:load", () => {
    const form = document.querySelector("#new_currency");

    if (form) {
        form.addEventListener("submit", (e) => {
            e.preventDefault();

            const data = new FormData(form);
            const url = form.action;

            fetch(url, {
                method: "POST",
                body: data,
                headers: {
                    "X-CSRF-Token": document.getElementsByName("csrf-token")[0].content,
                    "Accept": "text/javascript"
                },
                credentials: "same-origin"
            })
                .then((response) => response.text())
                .then((html) => {
                    const parser = new DOMParser();
                    const xmlDoc = parser.parseFromString(html, "text/html");
                    const scriptTag = xmlDoc.querySelector("body").firstElementChild;
                    eval(scriptTag.innerHTML);
                });
        });
    }
});
