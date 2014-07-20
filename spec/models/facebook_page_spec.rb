# == Schema Information
#
# Table name: facebook_pages
#
#  id         :integer          not null, primary key
#  page_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  fb_page_id :string(255)
#

require 'rails_helper'

RSpec.describe FacebookPage, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
