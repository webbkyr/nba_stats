class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :team_id
      t.string :conference

      t.timestamps
    end
  end
end
