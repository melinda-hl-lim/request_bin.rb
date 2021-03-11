class Bin < ApplicationRecord
  has_many :requests, foreign_key: 'bin_id'

  SLUG_LENGTH = 10

  def self.generate_slug
    (0..SLUG_LENGTH).map { rand(36).to_s(36) }.join
  end
end
