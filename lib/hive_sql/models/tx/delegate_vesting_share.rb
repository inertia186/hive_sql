module HiveSQL
  module Tx
    class DelegateVestingShare < HiveSQL::SqlBase

      self.table_name = :TxDelegateVestingShares

    end
  end
end

# Structure
#
# HiveSQL::Tx::DelegateVestingShare(
#   ID: integer,
#   tx_id: integer,
#   delegator: varchar,
#   delegatee: varchar,
#   vesting_shares: money,
#   timestamp: datetime
# )
