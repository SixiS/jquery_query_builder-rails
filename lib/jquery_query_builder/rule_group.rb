module JqueryQueryBuilder
  class RuleGroup
    attr_accessor :condition, :rules, :id_whitelist
    def initialize(rule_group_hash, id_whitelist: nil)
      self.condition = rule_group_hash['condition']
      self.rules = rule_group_hash['rules']
      self.id_whitelist = id_whitelist
    end

    def evaluate(object)
      case condition
      when "AND"
        rules.all? do |rule|
          rule_obj = get_rule_object(rule)
          if rule_obj.whitelisted?
            rule_obj.evaluate(object)
          else
            true  # ignore non whitelisted rule
          end
        end
      when "OR"
        rules.any? do |rule|
          rule_obj = get_rule_object(rule)
          if rule_obj.whitelisted?
            rule_obj.evaluate(object)
          else
            false  # ignore non whitelisted rule
          end
        end
      end
    end

    def sql_query
      queries = []
      rules.each do |rule|
        rule_object = get_rule_object(rule)
        # skip the conditional if the rule is not whitelisted
        sub_query = rule_object.sql_query if rule_object.whitelisted?
        queries << sub_query if sub_query  # query can be nil if all rules are rejected
      end

      if queries.empty?
        query_string = nil
      elsif queries.length == 1
        query_string = queries[0]
      elsif queries.length > 1
        case condition
        when "AND"
          query_string = queries.join(' AND ')
        when "OR"
          query_string = queries.join(' OR ')
        end
        query_string = "(#{query_string})"   # add parens for groups
      end

      return query_string
    end

    def whitelisted?
      # rule groups are always whitelisted, only rules can fail
      true
    end

    def get_rule_object(rule)
      if rule['rules'].present?
        RuleGroup.new(rule, id_whitelist: id_whitelist)
      else
        Rule.new(rule, id_whitelist: id_whitelist)
      end
    end
  end
end
