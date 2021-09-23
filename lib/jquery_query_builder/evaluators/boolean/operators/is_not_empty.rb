module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class IsNotEmpty
          def evaluate(input, value)
            input.present?
          end
        end
      end
    end
  end
end
