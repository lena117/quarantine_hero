class CreateHelpOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :help_offers do |t|
      t.integer :offering_id
      t.text :title
      t.text :description
      t.date :date_begin
      t.date :date_end
      t.text :location

      t.timestamps
    end
  end
end
