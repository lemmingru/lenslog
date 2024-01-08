class LensType < ApplicationRecord
  belongs_to :user
  has_many :lenses

  validates :wearing_period, presence: true, numericality: { only_integer: true, greater_than: 1 }
  validates :manufacturer, presence: true
  validates :status, inclusion: { in: %w[Active Deleted] }
end
