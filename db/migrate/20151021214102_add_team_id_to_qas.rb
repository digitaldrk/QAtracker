class AddTeamIdToQas < ActiveRecord::Migration
  def change
    add_column :qas, :team_id, :integer
  end
end
