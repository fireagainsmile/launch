# Lambda Chain Documentation

This documentation site is automatically deployed to [https://github.com/LambdaIM/launch](https://github.com/LambdaIM/launch).

The main documentation is stored in the `docs` folder and is generated with [Mkdocs](https://www.mkdocs.org/).

## How to Change the Docs

- install `mkdocs`
- In most times, you only need to add new pages with links on existing pages, such as index.md 
or *.md in `api-reference` fold. These files are all `markdown` format.
- Once you finish the editing, run `mkdocs serve` in the `Lambda-Chain` directory, then you can 
preview the site via http://127.0.0.1:8000/. 

## Generating HTTP API Markdown

Use the following command to generate the Markdown documentation for the HTTP API **from this repo's root directory**:
```bash
$ make build-markdown-http-docs
```

