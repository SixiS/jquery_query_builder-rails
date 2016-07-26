module JqueryQueryBuilder
  module Operators
    class NotEndsWith
      def evaluate(left, right)
        !left.end_with?(right)
      end
    end
  end
end
