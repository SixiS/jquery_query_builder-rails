module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class Equal
          def evaluate(left, right)
            left == right
          end
        end
      end
    end
  end
end
