module JqueryQueryBuilder
  module Operators
    class NotEndsWith
      def evaluate(left, right)
        !left.ends_with?(right)
      end
    end
  end
end
