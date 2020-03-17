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
  validates :title, :presence => true
  validates :description, :presence => true
  validates :date_begin, :presence => true
  validates :date_end, :presence => true
  validates :location, :presence => true
  
  belongs_to(:offering, {:class_name => "User", :foreign_key => "offering_id"})
  has_many(:comment_help_offers, {:dependent => :destroy})

 def comments
    return CommentHelpOffer.where({ :help_offer_id => self.id })
  end
  
end

