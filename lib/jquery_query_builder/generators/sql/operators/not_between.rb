module JqueryQueryBuilder
  module Generators
    module SQL
      module Operators
        class NotBetween
          def generate(field, value)
            # sanitize_sql_for_conditions is made public in Rails 5.2
            Sanitizor.sanitize(["(#{field} NOT BETWEEN ? AND ?)", bounds[0], bounds[1]] )
          end
        end
      end
    end
  end
end
