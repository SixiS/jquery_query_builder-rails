#require all the operators
Dir[File.join(File.dirname(__FILE__) + '/operators', "**/*.rb")].each do |f|
  require f
end

module JqueryQueryBuilder
  class Operator
    SPECIAL_CASE_MAP = {
    }

    def self.get_operator_class(operator)
      operator_class = SPECIAL_CASE_MAP[operator] || operator.camelize

      begin
        operator_class = "#{operator_module}::#{operator_class}".constantize
      rescue NameError
        raise "Unknown operator #{operator} used."
      end
    end

    def self.operator_module
      "JqueryQueryBuilder::Operators"
    end
  end
end

__END__

equal
not_equal
in
not_in
less
less_or_equal
greater
greater_or_equal
between
not_between
begins_with
not_begins_with
contains
not_contains
ends_with
not_ends_with
is_empty
is_not_empty
is_null
is_not_null
