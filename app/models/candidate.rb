# == Schema Information
#
# Table name: candidates
#
#  id          :integer          not null, primary key
#  name        :string
#  last_name   :string
#  public_name :string
#  role_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Candidate < ApplicationRecord
  belongs_to :role

  validates :name, :last_name, :public_name, presence: true
end
