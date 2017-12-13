class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  belongs_to :role

  validate :user_voted_in_role?

  private

  	def user_voted_in_role?
  		self.errors.add(:base, "Você já votou para esse cargo!") if Vote.where(user_id: self.user_id, role_id: self.role_id).present?
  	end
end
