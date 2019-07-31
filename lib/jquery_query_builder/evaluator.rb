require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'
require 'jquery_query_builder/operator'
require 'jquery_query_builder/rule_group'
require 'jquery_query_builder/rule'
require 'json'

module JqueryQueryBuilder
  class Evaluator
    attr_accessor :parsed_rule_set
    attr_accessor :id_whitelist

    def initialize(rule_set, id_whitelist: nil)
      if rule_set.is_a? String
        #assuming the json was passed in
        self.parsed_rule_set = JSON.parse(rule_set)
      else
        self.parsed_rule_set = rule_set
      end

      # whitelist of ids to restrict the rules to just those within the whitelist
      self.id_whitelist = id_whitelist
    end

    def get_matching_objects(objects)
      objects.select{|o| object_matches_rules?(o)}
    end

    def object_matches_rules?(object)
      RuleGroup.new(parsed_rule_set, id_whitelist: id_whitelist).evaluate(object)
    end

    def sql_query
      RuleGroup.new(parsed_rule_set, id_whitelist: id_whitelist).sql_query
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
