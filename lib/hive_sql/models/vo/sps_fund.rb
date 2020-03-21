module HiveSQL
  module Vo
    class SpsFund < HiveSQL::SqlBase

      self.table_name = :VOSpsFund

    end
  end
end

# Structure
#
# HiveSQL::Vo::SpsFund(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   additional_funds: money
# )
