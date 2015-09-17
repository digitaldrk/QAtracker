class CreateQas < ActiveRecord::Migration
  def change
    create_table :qas do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
