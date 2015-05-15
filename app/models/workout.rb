class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises, dependent: :destroy

  def date
    @date = self.created_at
    @date.strftime("%B %d, %Y")
  end
end
