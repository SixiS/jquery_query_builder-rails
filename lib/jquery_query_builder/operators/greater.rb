module JqueryQueryBuilder
  module Operators
    class Greater
      def evaluate(left, right)
        left > right
      end

      def sql_query(id, value)
        #sanitize_sql_for_conditions(["(where '?' = '?')", id, value])
        "(#{id} > #{value.to_f})"
      end
    end
  end
end
