class CreateCommentEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :comment_events do |t|
      t.text :body
      t.jsonb :metadata, default: {}

      t.timestamps
    end
  end
end
