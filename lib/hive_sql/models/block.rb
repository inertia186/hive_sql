module HiveSQL
  class Block < HiveSQL::SqlBase

    self.table_name = :Blocks
    self.primary_key = :block_num
    
    has_many :transactions, foreign_key: :block_num

  end
end

# Structure
#
# HiveSQL::Block(
#   block_num: integer,
#   timestamp: datetime,
#   witness: varchar
# )
