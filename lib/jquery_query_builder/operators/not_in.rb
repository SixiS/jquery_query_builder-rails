module JqueryQueryBuilder
  module Operators
    class NotIn
      def evaluate(left, right)
        !right.include?(left)
      end

      def sql_query(id, value)
        value = value.join(', ') if value.is_a?(Array)
        # sanitize_sql_for_conditions is made public in Rails 5.2
        ApplicationRecord.send(:sanitize_sql_for_conditions, ["(#{id} NOT IN(?))", value] )
      end
    end
  end
end
