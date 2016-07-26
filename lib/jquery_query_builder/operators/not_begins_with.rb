module JqueryQueryBuilder
  module Operators
    class NotBeginsWith
      def evaluate(left, right)
        !left.start_with?(right)
      end
    end
  end
end
