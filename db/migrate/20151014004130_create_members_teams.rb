class CreateMembersTeams < ActiveRecord::Migration
  def change
    create_table :members_teams, id: false do |t|
      t.integer :team_id
      t.integer :member_id
    end
    add_index :members_teams, [:team_id, :member_id]
    remove_column :members, :team_id, :integer
  end
end
