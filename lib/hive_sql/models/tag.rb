module HiveSQL
  class Tag < HiveSQL::SqlBase

    self.table_name = :Tags
    
    belongs_to :comment, foreign_key: 'comment_ID', class_name: 'HiveSQL::Comment'
  end
end

# Structure
#
# HiveSQL::Tag(
#   comment_ID integer,
#   tag varchar
# )
