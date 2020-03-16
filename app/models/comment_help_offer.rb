# == Schema Information
#
# Table name: comment_help_offers
#
#  id            :integer          not null, primary key
#  body          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  author_id     :integer
#  help_offer_id :integer
#

class CommentHelpOffer < ApplicationRecord
end
