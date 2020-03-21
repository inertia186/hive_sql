module HiveSQL
  module Tx
    class Feed < HiveSQL::SqlBase

      self.table_name = :TxFeeds

    end
  end
end

# Structure
#
# HiveSQL::Tx::Feed(
#   ID: integer,
#   tx_id: integer,
#   publisher: varchar,
#   exchange_rate_base: money,
#   exchange_rate_quote: money,
#   timestamp: datetime
# )
