module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class Greater
          def evaluate(left, right)
            left > right
          end
        end
      end
    end
  end
end
