module HiveSQL
  module Tx
    class EscrowApprove < HiveSQL::SqlBase

      self.table_name = :TxEscrowApproves

    end
  end
end

# Structure
#
# HiveSQL::Tx::EscrowApprove(
#   ID: integer,
#   tx_id: integer,
#   from: varchar,
#   to: varchar,
#   agent: varchar,
#   who: varchar,
#   escrow_id: integer,
#   approve: boolean,
#   timestamp: datetime
# )
