module JqueryQueryBuilder
  module Operators
    class IsEmpty
      def evaluate(input, value)
        input.is_blank?
      end
    end
  end
end
