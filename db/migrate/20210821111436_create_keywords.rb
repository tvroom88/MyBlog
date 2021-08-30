class CreateKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :keywords do |t|
      t.string :keyword, index: {unique: true}
      t.string :user_ids

      t.timestamps
    end
  end
end
