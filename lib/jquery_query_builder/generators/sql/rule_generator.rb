module JqueryQueryBuilder
  module Generators
    module SQL
      class RuleGenerator
        attr_accessor :rule, :field_whitelist
        def initialize(rule, field_whitelist: nil)
          self.rule = rule
          self.field_whitelist = field_whitelist
        end

        def generate
          field = rule.id
          value = rule.get_value
          get_operator.generate(field, value)
        end

        def whitelisted?
          return true if field_whitelist.blank?
          field_whitelist.include?(rule.id)
        end

        def get_operator
          rule_operator = rule.operator
          JqueryQueryBuilder::Generators::SQL::Operator.get_operator_class(rule_operator).new
        end
      end
    end
  end
end