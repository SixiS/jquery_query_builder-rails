require 'active_record'

module JqueryQueryBuilder
  module Generators
    module SQL
      class Sanitizor
        def self.sanitize(query)
          # TODO - Need to make it so we can pass in the model
          # to get the connection from to do the sanitization.
          ActiveRecord::Base.send(:sanitize_sql_for_conditions, query)
        end
      end
    end
  end
end