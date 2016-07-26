module JqueryQueryBuilder
  module Operators
    class BeginsWith
      def evaluate(left, right)
        left.start_with?(right)
      end
    end
  end
end
