module JqueryQueryBuilder
  module Generators
    module SQL
      module Operators
        class IsNull
          def generate(field, value)
            # sanitize_sql_for_conditions is made public in Rails 5.2
            Sanitizor.sanitize(["(#{field} IS NULL)"] )
          end
        end
      end
    end
  end
end
