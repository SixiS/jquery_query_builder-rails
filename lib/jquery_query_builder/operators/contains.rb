module JqueryQueryBuilder
  module Operators
    class Contains
      def evaluate(left, right)
        left.include?(right)
      end
    end
  end
end
