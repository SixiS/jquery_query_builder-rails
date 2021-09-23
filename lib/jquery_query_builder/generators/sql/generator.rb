require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'

require 'jquery_query_builder/generators/sql/operator'
require 'jquery_query_builder/generators/sql/sanitizor'
require 'jquery_query_builder/generators/sql/rule_group_generator'

module JqueryQueryBuilder
  module Generators
    module SQL
      class Generator
        attr_accessor :rule_group, :field_whitelist

        def initialize(rule_group, field_whitelist: nil)
          self.rule_group = rule_group
          self.field_whitelist = field_whitelist
        end

        def generate
          RuleGroupGenerator.new(rule_group, field_whitelist: field_whitelist).generate
        end
      end
    end
  end
end