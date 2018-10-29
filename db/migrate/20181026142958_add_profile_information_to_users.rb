class AddProfileInformationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :website, :string
    add_column :users, :nickname, :string
    add_column :users, :avatar, :string
    add_column :users, :company, :string
    add_column :users, :location, :string
  end
end
