module HiveSQL
  module Vo
    class Interest < HiveSQL::SqlBase

      self.table_name = :VOInterests

    end
  end
end

# Structure
#
# HiveSQL::Vo::Interest(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   owner: varchar,
#   Interest: money
# )