class Bin < ApplicationRecord
  has_many :requests, foreign_key: 'bin_id', dependent: :delete_all
  before_create :generate_slug

  private

  def generate_slug
    self.slug = SecureRandom.hex 4
  end
end
