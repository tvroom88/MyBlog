class CreateAlarms < ActiveRecord::Migration[6.1]
  def change
    create_table :alarms do |t|
      t.integer :user_id
      t.string :keyword
      t.integer :blog_id
      t.timestamps
    end
  end
end
