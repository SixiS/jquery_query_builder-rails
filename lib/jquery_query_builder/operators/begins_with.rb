module JqueryQueryBuilder
  module Operators
    class BeginsWith
      def evaluate(left, right)
        left.starts_with?(right)
      end
    end
  end
end
