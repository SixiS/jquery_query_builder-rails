module JqueryQueryBuilder
  module Operators
    class NotIn
      def evaluate(left, right)
        !right.include?(left)
      end
    end
  end
end
