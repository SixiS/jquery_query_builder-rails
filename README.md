# jQuery QueryBuilder - rails

Many thanks to [mistic100](https://github.com/mistic100) for the awesome jQuery plugin.

This gem has 2 parts.
- [Assets needed for the jquery-query-builder plugin for the rails asset pipeline](#asset-pipeline-part)
- [Ruby evaluator for the json rule output from jquery-query-builder](#ruby-rule-evaluator)

# Asset Pipeline Part

jquery_query_builer-rails wraps the [query-builder.js](http://querybuilder.js.org//) library
and some of its dependencies in a rails engine for simple use with the asset pipeline provided by Rails 3.1 and higher.

The gem includes the development (non-minified) source for ease of exploration.
The asset pipeline will minify in production.

jQuery QueryBuilder is a jQuery plugin that provides a UI component to create queries and filters.

Please see the [documentation](http://querybuilder.js.org/) for details.

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

After that you can use the QueryBuilder to any \<div\> you want.
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

# Ruby Rule Evaluator

You can use the evaluator to check if objects match the json rules produced by the jQuery plugin.

Objects are hashes or other objects that can be accessed with hash-like bracket functionality e.g. object['test'].

You can access nested fields with a dot notation.
e.g. fields.Question to access {'fields' => {'Question' => 'Answer'}}

## Example Usage
```ruby
rule_json = %|{
  "condition": "OR",
  "rules": [{
    "id": "Integer_Question",
    "field": "Integer_Question",
    "type": "integer",
    "input": "text",
    "operator": "equal",
    "value": "5"
  },
  {
    "id": "fields.String_Question",
    "field": "fields.String_Question",
    "type": "string",
    "input": "text",
    "operator": "equal",
    "value": "test"
  }]
}|

object_1 = {'Integer_Question' => 5, 'fields' => {'String_Question' => 'test'}}
object_2 = {'Integer_Question' => 15}
objects = [object_1, object_2]

evaluator = JqueryQueryBuilder::Evaluator.new(rule_json)
evaluator.object_matches_rules?(object_1) #=> true
evaluator.object_matches_rules?(object_2) #=> false

evaluator.get_matching_objects(objects) #=> [object_1]
```

Note: For the constructor, you can pass in a JSON string or an already parsed object.

## Operators

All the default operators have been implemented.

If you need to extend the operators with custom ones you have, just create a class for the operator.
The class name should be the camelized version of the underscored operator.

e.g. For the operator "equals_five" the class name should be "EqualsFive".

The class must have an evaluate(input, value), even if a value is not required.

e.g.
```ruby
# config/intializers/jquery_query_builder_operators.rb
module JqueryQueryBuilder
  module Operators
    class IsDivisibleBy
      def evaluate(input, value)
        input % value == 0
      end
    end
    
    class EqualsFive
      def evaluate(input, ignored_value)
        input == 5
      end
    end
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
