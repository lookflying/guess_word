class Judge < ActiveRecord::Base
  belongs_to :user
  belongs_to :guess
end
