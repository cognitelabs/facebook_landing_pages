# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  token      :string(255)
#  html       :text
#  css        :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Page, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
