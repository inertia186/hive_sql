module HiveSQL
  module Vo
    class CommentBenefactorReward < HiveSQL::SqlBase

      self.table_name = :VOCommentBenefactorRewards

    end
  end
end

# Structure
#
# HiveSQL::Vo::CurationReward(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   benefactor: varchar,
#   author: varchar,
#   permlink: varchar,
#   hbd_payout: money
#   hive_payout: money
#   vesting_payout: decimal(18,6)
# )
