module JqueryQueryBuilder
  module Operators
    class Greater
      def evaluate(left, right)
        left > right
      end

      def sql_query(id, value)
        # sanitize_sql_for_conditions is made public in Rails 5.2
        ApplicationRecord.send(:sanitize_sql_for_conditions, ["(#{id} > ?)", value] )
      end
    end
  end
end
