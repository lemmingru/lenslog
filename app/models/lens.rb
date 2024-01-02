class Lens < ApplicationRecord
  belongs_to :lens_type
  has_many :usages
  validates :status, inclusion: { in: %w[Active Inactive Disposed] }
end
