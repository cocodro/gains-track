class Exercise < ActiveRecord::Base
  belongs_to :workout
  has_many :sets, dependent: :destroy
end
