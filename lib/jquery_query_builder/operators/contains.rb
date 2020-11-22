module JqueryQueryBuilder
  module Operators
    class Contains
      def evaluate(left, right)
        return false if left.nil?
        left.include?(right)
      end

      def sql_query(id, value)
        # sanitize_sql_for_conditions is made public in Rails 5.2
        ApplicationRecord.send(:sanitize_sql_for_conditions, ["(LOWER(#{id}) LIKE LOWER(?))", "%#{value}%"] )
      end
    end
  end
end
