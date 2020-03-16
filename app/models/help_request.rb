# == Schema Information
#
# Table name: help_requests
#
#  id           :integer          not null, primary key
#  date_begin   :date
#  date_end     :string
#  description  :text
#  location     :text
#  title        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  requester_id :integer
#

class HelpRequest < ApplicationRecord
end
