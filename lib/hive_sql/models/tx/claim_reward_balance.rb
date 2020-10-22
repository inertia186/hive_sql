module HiveSQL
  module Tx
    class ClaimRewardBalance < HiveSQL::SqlBase

      self.table_name = :TxClaimRewardBalances

    end
  end
end

# Structure
#
# HiveSQL::Tx::ClaimRewardBalance(
#   ID: integer,
#   tx_id: integer,
#   account: varchar,
#   reward_hive: money,
#   reward_hbd: money,
#   reward_vests: money,
#   timestamp: datetime
# )
