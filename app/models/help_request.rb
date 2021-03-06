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
  validates :title, :presence => true
  validates :description, :presence => true
  validates :date_begin, :presence => true
  validates :date_end, :presence => true
  validates :location, :presence => true
  
  belongs_to :requester, :class_name => "User"
  has_many :comment_help_requests, :dependent => :destroy

   def comments
    return CommentHelpRequest.where({ :help_request_id => self.id })
  end
end
