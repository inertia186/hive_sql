module HiveSQL
  module Tx
    class Withdraw < HiveSQL::SqlBase

      self.table_name = :TxWithdraws

    end
  end
end

# Structure
#
# HiveSQL::Tx::Withdraw(
#   ID: integer,
#   tx_id: integer,
#   account: varchar,
#   vesting_shares: money,
#   timestamp: datetime
# )
