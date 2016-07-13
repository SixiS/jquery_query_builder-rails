# jquery_query_builer-rails

jquery_query_builer-rails wraps the [query-builder.js](http://querybuilder.js.org//) library
and some of its dependencies in a rails engine for simple use with the asset pipeline provided by Rails 3.1 and higher.
The gem includes the development (non-minified) source for ease of exploration.
The asset pipeline will minify in production.

jQuery QueryBuilder is a jQuery plugin that provides a UI component to create queries and filters.
Please see the
[documentation](http://querybuilder.js.org/) for details.

The two dependencies that are not included with this gem are:
- jQuery >= 1.10
- Bootstrap >= 3.1 (CSS Buttons and Utilities only)

You probably already have jQuery included in your Rails project and the bootstrap dependency is optional.
Please see this [how to](http://querybuilder.js.org/dev/no-bootstrap.html) to go on without boostrap.

## Usage

Add the following to your gemfile:

    gem 'jquery_query_builder-rails'

Add the following directive to your Javascript manifest file after jQuery (application.js):

    //= require jquery.extendext
    //= require doT
    //= require query-builder

Add the following directive to your Stylesheet manifest file (application.scss):

    @import "query-builder.default";
or
    @import "query-builder.dark";

depending on the theme you want to use.

After that you can use the QueryBuilder to any <div> you want.
```html
<div id="builder"></div>

<script>
  $('#builder').queryBuilder({
    filters: [ ... ]
  });
</script>
```
Read more here:
[jQuery QueryBuilder](http://querybuilder.js.org//)

Coming Soon:

Ruby evaluator for the json output.
