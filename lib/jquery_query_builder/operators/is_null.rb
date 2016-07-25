module JqueryQueryBuilder
  module Operators
    class IsNull
      def evaluate(input, value)
        input.nil?
      end
    end
  end
end
