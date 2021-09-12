require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'
require 'jquery_query_builder/evaluators/boolean/operator'
require 'jquery_query_builder/evaluators/boolean/rule_group_evaluator'

module JqueryQueryBuilder
  module Evaluators
    module Boolean
      class Evaluator
        attr_accessor :rule_group
        def initialize(rule_group)
          self.rule_group = rule_group
        end

        def get_matching_objects(objects)
          objects.select{|o| object_matches_rules?(o)}
        end

        def object_matches_rules?(object)
          RuleGroupEvaluator.new(rule_group).evaluate(object)
        end
      end
    end
  end
end