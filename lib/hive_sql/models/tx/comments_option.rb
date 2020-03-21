module HiveSQL
  module Tx
    class CommentsOption < HiveSQL::SqlBase

      self.table_name = :TxCommentsOptions

    end
  end
end

# Structure
#
# HiveSQL::Tx::CommentsOption(
#   ID: integer,
#   tx_id: integer,
#   author: varchar,
#   permlink: varchar,
#   max_accepted_payout: money,
#   percent_steem_dollars: integer,
#   allow_votes: boolean,
#   allow_curation_rewards: boolean,
#   timestamp: datetime
# )
