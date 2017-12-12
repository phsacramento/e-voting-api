# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord

	validates :title, presence: true
	
	has_many :votes

	def voted_by?(current_user)
		self.votes.where(user_id: current_user.id).present?
	end
end
