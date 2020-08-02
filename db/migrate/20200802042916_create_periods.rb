class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.string :weekday
      t.string :subject
      t.integer :period_num
      t.integer :user_id

      t.timestamps
    end
  end
end
