module HiveSQL
  module Vo
    class FillTransferFromSavings < HiveSQL::SqlBase

      self.table_name = :VOFillTransferFromSavings

    end
  end
end

# Structure
#
# HiveSQL::Vo::FillTransferFromSavings(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   from: varchar,
#   to: varchar,
#   amount: money,
#   amount_symbol,
#   requestid: bigint,
#   memo: text
# )
