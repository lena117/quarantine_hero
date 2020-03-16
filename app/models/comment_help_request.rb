# == Schema Information
#
# Table name: comment_help_requests
#
#  id              :integer          not null, primary key
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author_id       :integer
#  help_request_id :integer
#

class CommentHelpRequest < ApplicationRecord
  belongs_to :author, :class_name => "User"
  belongs_to :help_request


  def commenter
    return User.where({ :id => self.author_id }).at(0)
  end
  
end
