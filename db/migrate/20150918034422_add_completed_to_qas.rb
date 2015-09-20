class AddCompletedToQas < ActiveRecord::Migration
  def change
    add_column :qas, :completed, :boolean, :default => false
  end
end
