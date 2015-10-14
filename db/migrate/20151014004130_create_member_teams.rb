class CreateMemberTeams < ActiveRecord::Migration
  def change
    create_table :member_teams do |t|
      t.integer :team_id
      t.integer :member_id
      t.timestamps null: false
    end
    
    remove_column :members, :team_id

  end
end
