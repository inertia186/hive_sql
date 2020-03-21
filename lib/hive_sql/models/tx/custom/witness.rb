module HiveSQL
  module Tx
    class Custom::Witness < HiveSQL::Tx::Custom
      default_scope { where(tid: :witness) }
      
      scope :account, lambda { |account|
        where("JSON_VALUE(json_metadata, '$[1].account') = ?", account)
      }
    end
  end
end
