class AddMemberToQas < ActiveRecord::Migration
  def change
    add_reference :qas, :member, index: true, foreign_key: true
  end
end
