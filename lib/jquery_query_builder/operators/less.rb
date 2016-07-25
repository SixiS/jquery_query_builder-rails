module JqueryQueryBuilder
  module Operators
    class Less
      def evaluate(left, right)
        left < right
      end
    end
  end
end
