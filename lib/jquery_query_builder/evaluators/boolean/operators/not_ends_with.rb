module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class NotEndsWith
          def evaluate(left, right)
            !left.end_with?(right)
          end
        end
      end
    end
  end
end
