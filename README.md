# Wallabag JSON to HTML

As of today, [Wallabag](https://github.com/wallabag/wallabag) can export the articles in several format (JSON, CSV, EPUB, etc.), but [doesn't allow HTML](https://github.com/wallabag/wallabag/issues/3272).

This script intends to convert the JSON export to HTML in order to allow you to import the bookmarks into another bookmarks manager like [Buku](https://github.com/jarun/Buku) or [Shiori](https://github.com/RadhiFadlillah/shiori).

Note: the conversion from JSON to HTML is not perfect. Wallabag stores the pages content, but not their description. So a part of the content as used as description when possible.

## Installation

You need to install one gem:
```
gem install sanitize
```

## Usage
```
./json_to_html_bookmarks.rb import-file [export-file]
```

If you don't specify the `export-file` name, its default name will be `exported_bookmarks.html`
