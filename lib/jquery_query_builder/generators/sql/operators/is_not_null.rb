module JqueryQueryBuilder
  module Generators
    module SQL
      module Operators
        class IsNotNull
          def generate(field, value)
            # sanitize_sql_for_conditions is made public in Rails 5.2
            Sanitizor.sanitize(["(#{field} IS NOT NULL)"] )
          end
        end
      end
    end
  end
end
