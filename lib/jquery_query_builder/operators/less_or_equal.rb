module JqueryQueryBuilder
  module Operators
    class LessOrEqual
      def evaluate(left, right)
        left <= right
      end
    end
  end
end
