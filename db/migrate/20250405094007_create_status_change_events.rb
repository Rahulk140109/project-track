class CreateStatusChangeEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :status_change_events do |t|
      t.string :from_status
      t.string :to_status
      t.jsonb :metadata, default: {}

      t.timestamps
    end
  end
end
