class CreateCommentHelpOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_help_offers do |t|
      t.integer :author_id
      t.integer :help_offer_id
      t.text :body

      t.timestamps
    end
  end
end
