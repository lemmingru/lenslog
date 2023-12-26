class LensType < ApplicationRecord
  belongs_to :user
  has_many :lenses
end
