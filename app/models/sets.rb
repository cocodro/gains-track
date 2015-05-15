class Sets < ActiveRecord::Base
  belongs_to :exercise, dependent: :destroy
end
