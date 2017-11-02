module JqueryQueryBuilder
  class RuleGroup
    attr_accessor :condition, :rules
    def initialize(rule_group_hash)
      self.condition = rule_group_hash['condition']
      self.rules = rule_group_hash['rules']
    end

    def evaluate(object)
      rule_matches = false
      matched_rules = []
      mismatched_rules = []

      rules.each do |rule|
        rule_result = get_rule_object(rule).evaluate(object)
        if rule_result[:rule_matches] == true
          matched_rules << {rule: rule, rule_result: rule_result}
        else
          mismatched_rules << {rule: rule, rule_result: rule_result}
        end
      end

      case condition
      when "AND"
        rule_matches = matched_rules.present? && mismatched_rules.blank?
      when "OR"
        rule_matches = matched_rules.any?
      end

      {
        rule_matches: rule_matches,
        matched_rules: matched_rules,
        mismatched_rules: mismatched_rules
      }
    end

    def get_rule_object(rule)
      if rule['rules'].present?
        RuleGroup.new(rule)
      else
        Rule.new(rule)
      end
    end
  end
end
