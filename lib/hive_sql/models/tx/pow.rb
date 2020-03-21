module HiveSQL
  module Tx
    class Pow < HiveSQL::SqlBase

      self.table_name = :TxPows

    end
  end
end

# Structure
#
# HiveSQL::Tx::Pow(
#   ID: integer,
#   tx_id: integer,
#   worker_account: varchar,
#   block_id: varchar,
#   timestamp: datetime
# )
