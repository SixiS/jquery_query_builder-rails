module JqueryQueryBuilder
  module Evaluators
    module Boolean
      class RuleEvaluator
        attr_accessor :rule
        def initialize(rule)
          self.rule = rule
        end

        def evaluate(object)
          input = rule.get_input(object)
          value = rule.get_value
          get_operator.evaluate(input, value)
        end

        def get_operator
          rule_operator = rule.operator
          JqueryQueryBuilder::Evaluators::Boolean::Operator.get_operator_class(rule_operator).new
        end
      end
    end
  end
end