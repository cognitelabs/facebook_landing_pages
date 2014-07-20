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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :facebook_page do
    fb_page_id 1
    page_id 1
  end
end
