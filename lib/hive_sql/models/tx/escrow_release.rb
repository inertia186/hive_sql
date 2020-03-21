module HiveSQL
  module Tx
    class EscrowRelease < HiveSQL::SqlBase

      self.table_name = :TxEscrowReleases

    end
  end
end

# Structure
#
# HiveSQL::Tx::EscrowRelease(
#   ID: integer,
#   tx_id: integer,
#   from: varchar,
#   to: varchar,
#   agent: varchar,
#   who: varchar,
#   receiver: varchar,
#   escrow_id: integer,
#   sdb_amount: money,
#   steem_amount: money,
#   timestamp: datetime
# )
