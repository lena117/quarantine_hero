# == Schema Information
#
# Table name: help_offers
#
#  id          :integer          not null, primary key
#  date_begin  :date
#  date_end    :date
#  description :text
#  location    :text
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  offering_id :integer
#

class HelpOffer < ApplicationRecord
end
