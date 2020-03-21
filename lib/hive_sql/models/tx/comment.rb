module HiveSQL
  module Tx
    class Comment < HiveSQL::SqlBase

    	self.table_name = :TxComments

    end
  end
end

# Structure
#
# HiveSQL::Tx::Comment(
#   ID: integer,
#   tx_id: integer,
#   author: varchar,
#   permlink: varchar,
#   parent_author: varchar,
#   parent_permlink: varchar,
#   title: text,
#   body: text,
#   json_metadata: varchar_max,
#   timestamp: datetime
# )
