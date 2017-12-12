# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  surname                :string
#  cpf                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  role                   :string
#  current_request_at     :datetime
#

class User < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :surname, :cpf, :email, :role, presence: true
	validates_uniqueness_of :cpf, :email

	enumerize :role, in: [:admin, :user], default: :user

	def login=(login)
    @login = login
  end

  def login
    @login || self.cpf || self.email
  end

  def self.find_for_database_authentication(value)
    where("cpf = ? OR email = ?", value, value).first
  end

	def self.authenticate(user, password)
    user.valid_password?(password) ? user : false
  end
end
