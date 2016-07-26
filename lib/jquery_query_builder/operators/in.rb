module JqueryQueryBuilder
  module Operators
    class In
      def evaluate(left, right)
        right.include?(left)
      end
    end
  end
end
