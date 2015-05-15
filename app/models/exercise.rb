class Exercise < ActiveRecord::Base
  belongs_to :workout
  has_many :ex_sets, dependent: :destroy
  alias_method :sets, :ex_sets
end
