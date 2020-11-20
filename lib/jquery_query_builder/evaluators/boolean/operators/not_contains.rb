module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class NotContains
          def evaluate(left, right)
            !left.include?(right)
          end
        end
      end
    end
  end
end
