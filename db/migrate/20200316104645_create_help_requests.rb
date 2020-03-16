class CreateHelpRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :help_requests do |t|
      t.integer :requester_id
      t.text :title
      t.text :description
      t.date :date_begin
      t.string :date_end
      t.text :location

      t.timestamps
    end
  end
end
