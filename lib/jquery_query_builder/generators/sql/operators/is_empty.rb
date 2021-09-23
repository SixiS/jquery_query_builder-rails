module JqueryQueryBuilder
  module Generators
    module SQL
      module Operators
        class IsEmpty
          def generate(field, value)
            # sanitize_sql_for_conditions is made public in Rails 5.2
            Sanitizor.sanitize(["(#{field} = ?)", ''] )
          end
        end
      end
    end
  end
end
