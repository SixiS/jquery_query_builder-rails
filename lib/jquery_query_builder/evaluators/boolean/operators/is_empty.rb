module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class IsEmpty
          def evaluate(input, value)
            input.blank?
          end
        end
      end
    end
  end
end
