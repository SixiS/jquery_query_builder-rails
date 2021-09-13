module JqueryQueryBuilder
  module Generators
    module SQL
      module Operators
        class NotEndsWith
          def generate(field, value)
            # sanitize_sql_for_conditions is made public in Rails 5.2
            Sanitizor.sanitize(["(LOWER(#{field}) NOT LIKE LOWER(?))", "%#{value}"] )
          end
        end
      end
    end
  end
end
