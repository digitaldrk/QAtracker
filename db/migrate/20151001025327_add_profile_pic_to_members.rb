class AddProfilePicToMembers < ActiveRecord::Migration
  def change
    add_column :members, :profile_pic, :string
  end
end
