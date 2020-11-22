module JqueryQueryBuilder
  module Operators
    class IsEmpty
      def evaluate(input, value)
        input.blank?
      end

      def sql_query(id, value)
        "(#{id} = '')"
      end
    end
  end
end
