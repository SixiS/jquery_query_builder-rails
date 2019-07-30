module JqueryQueryBuilder
  module Operators
    class Contains
      def evaluate(left, right)
        return false if left.nil?
        left.include?(right)
      end

      def sql_query(id, value)
        #sanitize_sql_for_conditions(["(where '?' = '?')", id, value])
        "(#{id} like '%#{value}%')"
      end
    end
  end
end
