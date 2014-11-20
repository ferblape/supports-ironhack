class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.integer :challenge_id
      t.string :email
      t.timestamps
    end
  end
end
