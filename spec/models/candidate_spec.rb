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

require 'rails_helper'

RSpec.describe Candidate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
