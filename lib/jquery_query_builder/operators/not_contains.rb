module JqueryQueryBuilder
  module Operators
    class NotContains
      def evaluate(left, right)
        !left.include?(right)
      end
    end
  end
end
