module HiveSQL
  module Tx
    class Transfer < HiveSQL::SqlBase

      self.table_name = :TxTransfers

    end
  end
end

# Structure
#
# HiveSQL::Tx::Transfer(
#   ID: integer,
#   tx_id: integer,
#   type: varchar,
#   from: varchar,
#   to: varchar,
#   amount: money,
#   amount_symbol: varchar,
#   memo: text,
#   request_id: integer,
#   timestamp: datetime
# )
