module JqueryQueryBuilder
  module Operators
    class Equal
      def evaluate(left, right)
        left == right
      end
    end
  end
end
