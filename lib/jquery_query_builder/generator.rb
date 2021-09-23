require 'json'
require 'jquery_query_builder/rule'
require 'jquery_query_builder/rule_group'
require 'jquery_query_builder/generators/sql/generator'
require 'active_support/core_ext/module/delegation'

module JqueryQueryBuilder
  class Generator
    attr_accessor :parsed_rule_set, :generator
    def initialize(raw_rule_set, generator_class: Generators::SQL::Generator)
      if raw_rule_set.is_a? String
        #assuming the json was passed in
        self.parsed_rule_set = JSON.parse(raw_rule_set)
      else
        self.parsed_rule_set = raw_rule_set
      end

      rule_set = RuleGroup.new(parsed_rule_set)
      self.generator = generator_class.new(rule_set)
    end

    # All evaluators must implement
    delegate :generate, to: :generator
  end
end