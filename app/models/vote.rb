class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  belongs_to :role
end
