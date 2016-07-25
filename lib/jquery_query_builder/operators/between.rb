module JqueryQueryBuilder
  module Operators
    class Between
      def evaluate(input, bounds)
        input > bounds[0] && input < bounds[1]
      end
    end
  end
end
