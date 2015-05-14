class Exercise < ActiveRecord::Base
  belongs_to :workout, dependent: :destroy
end
