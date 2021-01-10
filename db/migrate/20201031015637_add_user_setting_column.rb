class AddUserSettingColumn < ActiveRecord::Migration[5.2]
  def change
    # add_column :users, :password_digest, :string
    add_column :users, :periods_per_day, :integer
    add_column :users, :show_saturday_flag, :boolean
    add_column :users, :show_sunday_flag, :boolean
  end
end
