# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates :username, :presence => true
  has_secure_password

  has_many :help_offers, :foreign_key => "offering_id", :dependent => :destroy
  has_many :help_requests, :foreign_key => "requester_id", :dependent => :destroy
  has_many :comment_help_requests, :foreign_key => "author_id", :dependent => :destroy
  has_many :comment_help_offers, :foreign_key => "author_id", :dependent => :destroy

end


