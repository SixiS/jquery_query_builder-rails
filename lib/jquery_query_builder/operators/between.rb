module JqueryQueryBuilder
  module Operators
    class Between
      def evaluate(input, bounds)
        input > bounds[0] && input < bounds[1]
      end

      def sql_query(id, bounds)
        # sanitize_sql_for_conditions is made public in Rails 5.2
        ApplicationRecord.send(:sanitize_sql_for_conditions, ["(#{id} BETWEEN ? AND ?)", bounds[0], bounds[1]] )
      end
    end
  end
end
