module JqueryQueryBuilder
  module Operators
    class EndsWith
      def evaluate(left, right)
        left.end_with?(right)
      end
    end
  end
end
