require "jquery_query_builder/rails/version"
require "jquery_query_builder/evaluator"
require "jquery_query_builder/generator"

module JqueryQueryBuilder
  module Rails
    require 'jquery_query_builder/rails/engine' if defined?(::Rails)
  end
end
