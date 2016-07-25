module JqueryQueryBuilder
  module Operators
    class NotBeginsWith
      def evaluate(left, right)
        !left.starts_with?(right)
      end
    end
  end
end
