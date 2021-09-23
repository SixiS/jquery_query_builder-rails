module JqueryQueryBuilder
  module Generators
    module SQL
      module Operators
        class Less
          def generate(field, value)
            # sanitize_sql_for_conditions is made public in Rails 5.2
            Sanitizor.sanitize(["(#{field} < ?)", value] )
          end
        end
      end
    end
  end
end
