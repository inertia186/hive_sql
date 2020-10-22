module HiveSQL
  module Vo
    class CommentPayoutUpdate < HiveSQL::SqlBase

      self.table_name = :VOCommentPayoutUpdates

    end
  end
end

# Structure
#
# HiveSQL::Vo::CommentPayoutUpdate(
#   ID: integer,
#   author: varchar,
#   permlink: varchar
# )
