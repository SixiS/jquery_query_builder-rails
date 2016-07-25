module JqueryQueryBuilder
  module Operators
    class In
      def evaluate(left, right)
        !left.include?(right)
      end
    end
  end
end
