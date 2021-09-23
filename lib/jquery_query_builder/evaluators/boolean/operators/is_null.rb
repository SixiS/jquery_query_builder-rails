module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class IsNull
          def evaluate(input, value)
            input.nil?
          end
        end
      end
    end
  end
end
