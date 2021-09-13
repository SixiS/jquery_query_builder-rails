module JqueryQueryBuilder
  module Generators
    module SQL
      module Operators
        class BeginsWith
          def generate(field, value)
            # sanitize_sql_for_conditions is made public in Rails 5.2
            Sanitizor.sanitize(["(LOWER(#{field}) LIKE LOWER(?))", "#{value}%"] )
          end
        end
      end
    end
  end
end
