class AddDescriptionToQas < ActiveRecord::Migration
  def change
    add_column :qas, :description, :string
  end
end
