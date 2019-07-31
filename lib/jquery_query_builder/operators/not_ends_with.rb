module JqueryQueryBuilder
  module Operators
    class NotEndsWith
      def evaluate(left, right)
        !left.end_with?(right)
      end

      def sql_query(id, value)
        # sanitize_sql_for_conditions is made public in Rails 5.2
        ApplicationRecord.send(:sanitize_sql_for_conditions, ["(#{id} NOT LIKE ?)", "%#{value}"] )
      end
    end
  end
end
