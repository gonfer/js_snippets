# JS Snippets
Here you will find a collection of handy code snippets.

## Get Useful Body URLs

```javascript
class get_useful_body_urls
{
    constructor()
    {
        this.canonical = { "Name": "Canonical", "URL": document.querySelector("link[rel='canonical']").getAttribute("href") };
        this.previous = { "Name": "Previous", "URL": document.querySelector("link[rel='prev']").getAttribute("href") };
        this.next = { "Name": "Next", "URL": document.querySelector("link[rel='next']").getAttribute("href") };
    }
}

const urls = new get_useful_body_urls();

console.table(urls)
```
