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

class FacebookPage < ActiveRecord::Base

  belongs_to :page
end
