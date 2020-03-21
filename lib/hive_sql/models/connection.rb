require 'rest-client'
require 'nokogiri'

module HiveSQL
  class Connection < HiveSQL::SqlBase

    self.table_name = nil

    def self.tables
      self.connection.tables
    end

    def self.columns(model_name)
      "HiveSQL::#{model_name}".constantize.columns.map(&:name)
    end

  end
end
