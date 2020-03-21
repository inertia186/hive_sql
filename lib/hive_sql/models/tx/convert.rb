module HiveSQL
  module Tx
    class Convert < HiveSQL::SqlBase

      self.table_name = :TxConverts

    end
  end
end

# Structure
#
# HiveSQL::Tx::Convert(
#   ID: integer,
#   tx_id: integer,
#   owner: varchar,
#   requestid: integer,
#   amount: money,
#   timestamp: datetime
# )
