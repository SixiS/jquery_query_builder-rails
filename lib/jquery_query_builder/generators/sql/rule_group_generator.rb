require 'jquery_query_builder/generators/sql/rule_generator'

module JqueryQueryBuilder
  module Generators
    module SQL
      class RuleGroupGenerator
        attr_accessor :rule_group, :field_whitelist
        def initialize(rule_group, field_whitelist: nil)
          self.rule_group = rule_group
          self.field_whitelist = field_whitelist
        end

        def generate
          rules = rule_group.rules

          queries = []
          rules.each do |rule|
            rule_generator = get_rule_generator(rule)
            # skip the conditional if the rule is not whitelisted
            sub_query = rule_generator.generate if rule_generator.whitelisted?
            queries << sub_query if sub_query  # query can be nil if all rules are rejected
          end

          query_string = nil

          if queries.length == 1
            query_string = queries[0]
          elsif queries.length > 1
            case rule_group.condition
            when "AND"
              query_string = queries.join(' AND ')
            when "OR"
              query_string = queries.join(' OR ')
            end
            query_string = "(#{query_string})"   # add parens for groups
          end

          query_string
        end

        def whitelisted?
          # rule groups are always whitelisted, only rules can fail
          true
        end

        def get_rule_generator(rule)
          if rule.is_a?(RuleGroup)
            RuleGroupGenerator.new(rule, field_whitelist: field_whitelist)
          else
            RuleGenerator.new(rule, field_whitelist: field_whitelist)
          end
        end

      end
    end
  end
end