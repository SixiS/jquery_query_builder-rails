module JqueryQueryBuilder
  module Operators
    class Greater
      def evaluate(left, right)
        left > right
      end
    end
  end
end
