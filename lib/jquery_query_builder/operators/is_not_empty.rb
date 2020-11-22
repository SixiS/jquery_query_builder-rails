module JqueryQueryBuilder
  module Operators
    class IsNotEmpty
      def evaluate(input, value)
        input.present?
      end

      def sql_query(id, value)
        "(#{id} != '')"
      end
    end
  end
end
