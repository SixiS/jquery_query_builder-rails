module JqueryQueryBuilder
  module Operators
    class NotEqual
      def evaluate(left, right)
        left != right
      end
    end
  end
end
