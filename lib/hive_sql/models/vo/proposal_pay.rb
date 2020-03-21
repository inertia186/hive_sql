module HiveSQL
  module Vo
    class ProposalPay < HiveSQL::SqlBase

      self.table_name = :VOProposalPay

    end
  end
end

# Structure
#
# HiveSQL::Vo::ProposalPay(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   payment: money,
#   trx_id: varchar,
#   op_in_trx: integer
# )
