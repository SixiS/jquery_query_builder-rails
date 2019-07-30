module JqueryQueryBuilder
  class RuleGroup
    attr_accessor :condition, :rules
    def initialize(rule_group_hash)
      self.condition = rule_group_hash['condition']
      self.rules = rule_group_hash['rules']
    end

    def evaluate(object)
      case condition
      when "AND"
        rules.all?{|rule| get_rule_object(rule).evaluate(object) }
      when "OR"
        rules.any?{|rule| get_rule_object(rule).evaluate(object) }
      end
    end

    def sql_query
      queries = []
      rules.each do |rule|
        queries << get_rule_object(rule).sql_query
      end

      case condition
      when "AND"
        query = queries.join(' AND ')
      when "OR"
        query = queries.join(' OR ')
      end

      return query
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
