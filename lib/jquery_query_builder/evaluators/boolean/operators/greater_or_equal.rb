module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class GreaterOrEqual
          def evaluate(left, right)
            left >= right
          end
        end
      end
    end
  end
end
