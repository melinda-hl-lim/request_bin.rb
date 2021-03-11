class Bin < ApplicationRecord
  has_many :requests, foreign_key: 'bin_id'
end
