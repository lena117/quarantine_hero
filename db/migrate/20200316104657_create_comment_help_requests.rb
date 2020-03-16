class CreateCommentHelpRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_help_requests do |t|
      t.integer :author_id
      t.integer :help_request_id
      t.text :body

      t.timestamps
    end
  end
end
