module HiveSQL
  module Vo
    class FillConvertRequest < HiveSQL::SqlBase

      self.table_name = :VOFillConvertRequests

    end
  end
end

# Structure
#
# HiveSQL::Vo::FillConvertRequest(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   owner: varchar,
#   requestid: integer,
#   amount_in: varchar,
#   amount_out: varchar
# )
