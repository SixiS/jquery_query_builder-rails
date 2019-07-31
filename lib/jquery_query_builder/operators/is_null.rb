module JqueryQueryBuilder
  module Operators
    class IsNull
      def evaluate(input, value)
        input.nil?
      end

      def sql_query(id, value)
        "(#{id} IS NULL)"
      end
    end
  end
end
