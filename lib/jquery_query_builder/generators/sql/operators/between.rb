module JqueryQueryBuilder
  module Generators
    module SQL
      module Operators
        class Between
          def generate(field, bounds)
            # sanitize_sql_for_conditions is made public in Rails 5.2
            Sanitizor.sanitize(["(#{field} BETWEEN ? AND ?)", bounds[0], bounds[1]] )
          end
        end
      end
    end
  end
end
