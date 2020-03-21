module HiveSQL
  module Vo
    class ShutdownWitness < HiveSQL::SqlBase

      self.table_name = :VOShutdownWitnesses

    end
  end
end

# Structure
#
# HiveSQL::Vo::ShutdownWitness(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   owner: varchar
# )
