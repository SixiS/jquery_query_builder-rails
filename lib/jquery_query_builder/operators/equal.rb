include ActiveRecord::Sanitization::ClassMethods

module JqueryQueryBuilder
  module Operators
    class Equal
      def evaluate(left, right)
        left == right
      end

      def sql_query(id, value)
        #sanitize_sql_for_conditions(["(where '?' = '?')", id, value])
        "(#{id} = '#{value}')"
      end
    end
  end
end
