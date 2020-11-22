module JqueryQueryBuilder
  module Operators
    class IsNotNull
      def evaluate(input, value)
        !input.nil?
      end

      def sql_query(id, value)
        "(#{id} IS NOT NULL)"
      end
    end
  end
end
