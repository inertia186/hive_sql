module HiveSQL
  module Tx
    class Custom::Reblog < HiveSQL::Tx::Custom
      default_scope {
        where(tid: :follow).
        where("JSON_VALUE(json_metadata, '$[0]') = 'reblog'")
      }
      
      scope :account, lambda { |account|
        where("JSON_VALUE(json_metadata, '$[1].account') = ?", account)
      }
      
      scope :author, lambda { |author|
        where("JSON_VALUE(json_metadata, '$[1].author') = ?", author)
      }
      
      scope :permlink, lambda { |permlink|
        where("JSON_VALUE(json_metadata, '$[1].permlink') = ?", permlink)
      }
    end
  end
end
