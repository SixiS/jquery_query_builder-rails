module JqueryQueryBuilder
  class Rule
    attr_accessor :id, :field, :type, :input, :operator, :value, :id_whitelist
    def initialize(rule_hash, id_whitelist: nil)
      self.id = rule_hash['id']
      self.field = rule_hash['field']
      self.type = rule_hash['type']
      self.input = rule_hash['input']
      self.operator = rule_hash['operator']
      self.value = rule_hash['value']
      self.id_whitelist = id_whitelist
    end

    def whitelisted?
      return true unless id_whitelist.present?

      id_whitelist.include?(self.id)
    end

    def evaluate(object)
      get_operator.evaluate(get_input(object), get_value)
    end

    def sql_query
      get_operator.sql_query(self.id, get_value)
    end

    def get_operator
      JqueryQueryBuilder::Operator.get_operator_class(operator).new
    end

    def get_input(object)
      fields = field.split('.')
      result = object
      steps = fields.length
      fields.each_with_index do |field, i|
        last_step = i == steps - 1
        result = result[field]
        result = result.first if(result.is_a?(Array) && !last_step)
        break if result.nil?
      end
      if result.is_a? Array
        result.map{|v| typecast_value(v)}
      else
        typecast_value(result)
      end
    end

    def get_value
      if value.is_a? Array
        value.map{|v| typecast_value(v)}
      else
        typecast_value(value)
      end
    end

    def typecast_value(value_to_cast)
      return nil if value_to_cast.nil?

      case type
        when 'string'
          value_to_cast.to_s
        when 'integer'
          value_to_cast.to_i
        when 'double'
          value_to_cast.to_f
        when 'date'
          value_to_cast.is_a?(String) ? Date.parse(value_to_cast) : value_to_cast
        when 'time'
          value_to_cast.is_a?(String) ? Time.parse(value_to_cast) : value_to_cast
        when 'datetime'
          value_to_cast.is_a?(String) ? DateTime.parse(value_to_cast) : value_to_cast
        when 'boolean'
          value_to_cast == 'Yes' || value_to_cast == 'yes' || value_to_cast == 'True' || value_to_cast == 'true' || value_to_cast == true
        else
          value_to_cast
      end
    end
  end
end
