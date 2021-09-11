require 'jquery_query_builder/evaluators/boolean'

module JqueryQueryBuilder
  class Evaluator
    def initialize(rule_set, evaluator_class: Evaluators::Boolean)
      evaluator_class.new(rule_set)
    end
  end
end


__END__
Example rules:

{
  "condition": "AND",
  "rules": [{
    "id": "Decimal_Question",
    "field": "Decimal_Question",
    "type": "double",
    "input": "text",
    "operator": "equal",
    "value": "1.2"
  }, {
    "condition": "AND",
    "rules": [{
      "id": "Date_Question",
      "field": "Date_Question",
      "type": "date",
      "input": "text",
      "operator": "greater",
      "value": "2016-07-19"
    }, {
      "id": "Yes_No_Question",
      "field": "Yes_No_Question",
      "type": "boolean",
      "input": "select",
      "operator": "equal",
      "value": "true"
    }]
  }, {
    "condition": "OR",
    "rules": [{
      "id": "Select_Question",
      "field": "Select_Question",
      "type": "string",
      "input": "select",
      "operator": "equal",
      "value": "First Option"
    }, {
      "id": "Password_Question",
      "field": "Password_Question",
      "type": "string",
      "input": "text",
      "operator": "equal",
      "value": "asd"
    }]
  }, {
    "id": "Subform.Free_Text_Question",
    "field": "Subform.Free_Text_Question",
    "type": "string",
    "input": "text",
    "operator": "is_not_empty",
    "value": null
  }]
}

------------

{
  "condition": "AND",
  "rules": [{
    "id": "Integer_Question",
    "field": "Integer_Question",
    "type": "integer",
    "input": "text",
    "operator": "equal",
    "value": "5"
  }]
}
