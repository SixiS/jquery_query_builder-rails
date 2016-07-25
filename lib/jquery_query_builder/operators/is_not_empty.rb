module JqueryQueryBuilder
  module Operators
    class IsNotEmpty
      def evaluate(input, value)
        input.present?
      end
    end
  end
end
