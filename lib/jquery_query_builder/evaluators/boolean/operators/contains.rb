module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class Contains
          def evaluate(left, right)
            return false if left.nil?
            left.include?(right)
          end
        end
      end
    end
  end
end
