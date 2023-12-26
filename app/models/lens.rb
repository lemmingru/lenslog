class Lens < ApplicationRecord
  self.table_name = 'lenses'
  belongs_to :lens_type
  validates :status, inclusion: { in: %w[Active Inactive Disposed] }


end
