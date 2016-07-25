module JqueryQueryBuilder
  module Operators
    class GreaterOrEqual
      def evaluate(left, right)
        left >= right
      end
    end
  end
end
