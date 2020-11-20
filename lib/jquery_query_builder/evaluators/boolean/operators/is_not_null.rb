module JqueryQueryBuilder
  module Evaluators
    module Boolean
      module Operators
        class IsNotNull
          def evaluate(input, value)
            !input.nil?
          end
        end
      end
    end
  end
end
