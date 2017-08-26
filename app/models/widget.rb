class Widget < ApplicationRecord
  belongs_to :dashboard
  before_save :set_min_size

  private

  def set_min_size
    self.width = 100 if self.width < 100
    self.height = 100 if self.height < 100
    end
end
