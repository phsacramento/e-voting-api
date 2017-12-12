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

FactoryGirl.define do
  factory :candidate do
    name "MyString"
    last_name "MyString"
    public_name "MyString"
    role nil
  end
end
