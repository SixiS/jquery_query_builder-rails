module JqueryQueryBuilder
  module Operators
    class EndsWith
      def evaluate(left, right)
        left.ends_with?(right)
      end
    end
  end
end
