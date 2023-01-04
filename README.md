# JS Snippets
Here you will find a collection of handy code snippets.

## Get Useful Body URLs

```javascript
function create_buttons(obj)
{
    jQuery("<div>", {
        'class': "buttons_wrapper",
        'style': "top: 0; position: fixed;",
    }).appendTo(jQuery("body"));

    const input_prev = jQuery('<a href="' + obj.previous.URL + '" style="margin: 0 10px;" target="_blank" >Previous</a>');
    input_prev.appendTo(jQuery(".buttons_wrapper"));

    const input_next = jQuery('<a href="' + obj.next.URL + '" style="margin: 0 10px;" target="_blank" >Next</a>');
    input_next.appendTo(jQuery(".buttons_wrapper"));
}

class get_useful_body_urls {
    constructor() {
        this.canonical = { "Name": "Canonical", "URL": document.querySelector("link[rel='canonical']").getAttribute("href") };
        this.previous = { "Name": "Previous", "URL": document.querySelector("link[rel='prev']").getAttribute("href") };
        this.next = { "Name": "Next", "URL": document.querySelector("link[rel='next']").getAttribute("href") };

        create_buttons(this);
    }
}

const urls = new get_useful_body_urls();

console.table(urls)
```
