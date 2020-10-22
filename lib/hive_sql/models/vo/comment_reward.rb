module HiveSQL
  module Vo
    class CommentReward < HiveSQL::SqlBase

      self.table_name = :VOCommentRewards

    end
  end
end

# Structure
#
# HiveSQL::Vo::CommentPayoutUpdate(
#   ID: integer,
#   author: varchar,
#   permlink: varchar
#   payout: money
#   payout_symnol: varchar
# )
