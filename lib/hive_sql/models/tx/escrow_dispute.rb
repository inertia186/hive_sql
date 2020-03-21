module HiveSQL
  module Tx
    class EscrowDispute < HiveSQL::SqlBase

      self.table_name = :TxEscrowDisputes

    end
  end
end

# Structure
#
# HiveSQL::Tx::EscrowDispute(
#   ID: integer,
#   tx_id: integer,
#   from: varchar,
#   to: varchar,
#   agent: varchar,
#   who: varchar,
#   escrow_id: integer,
#   timestamp: datetime
# )
