require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'
require 'jquery_query_builder/evaluators/boolean/operator'
require 'jquery_query_builder/evaluators/boolean/rule_group'
require 'jquery_query_builder/evaluators/boolean/rule'

module JqueryQueryBuilder
  module Evaluators
    class Boolean < JqueryQueryBuilder::Evaluator
      attr_accessor :parsed_rule_set
      def initialize(rule_set)
        if rule_set.is_a? String
          #assuming the json was passed in
          self.parsed_rule_set = JSON.parse(rule_set)
        else
          self.parsed_rule_set = rule_set
        end
      end

      def get_matching_objects(objects)
        objects.select{|o| object_matches_rules?(o)}
      end

      def object_matches_rules?(object)
        RuleGroup.new(parsed_rule_set).evaluate(object)
      end
    end
  end
end