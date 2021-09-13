module JqueryQueryBuilder
  module Generators
    module SQL
      module Operators
        class NotBeginsWith
          def generate(field, value)
            # sanitize_sql_for_conditions is made public in Rails 5.2
            Sanitizor.sanitize(["(#{field} NOT LIKE ?)", "%#{value}%"] )
          end
        end
      end
    end
  end
end
