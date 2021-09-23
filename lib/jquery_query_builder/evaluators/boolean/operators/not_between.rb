module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class NotBetween
          def evaluate(input, bounds)
            input <= bounds[0] || input >= bounds[1]
          end
        end
      end
    end
  end
end
