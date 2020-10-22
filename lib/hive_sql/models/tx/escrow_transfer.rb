module HiveSQL
  module Tx
    class EscrowTransfer < HiveSQL::SqlBase

      self.table_name = :TxEscrowTransfers

    end
  end
end

# Structure
#
# HiveSQL::Tx::EscrowTransfer(
#   ID: integer,
#   tx_id: integer,
#   from: varchar,
#   to: varchar,
#   hdb_amount: money,
#   hive_amount: money,
#   escrow_id: integer,
#   agent: varchar,
#   fee: money,
#   fee_symbol: varchar,
#   json_meta: varchar_max,
#   ratification_deadline: datetime,
#   escrow_expiration: datetime,
#   timestamp: datetime
# )
