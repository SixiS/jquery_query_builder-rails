require 'jquery_query_builder/evaluators/boolean/rule_evaluator'

module JqueryQueryBuilder
  module Evaluators
    module Boolean
      class RuleGroupEvaluator
        attr_accessor :rule_group
        def initialize(rule_group)
          self.rule_group = rule_group
        end

        def evaluate(object)
          rules = rule_group.rules

          case rule_group.condition
          when "AND"
            rules.all?{|rule| get_rule_evaluator(rule).evaluate(object) }
          when "OR"
            rules.any?{|rule| get_rule_evaluator(rule).evaluate(object) }
          end
        end

        def get_rule_evaluator(rule)
          if rule.is_a?(RuleGroup)
            RuleGroupEvaluator.new(rule)
          else
            RuleEvaluator.new(rule)
          end
        end

      end
    end
  end
end