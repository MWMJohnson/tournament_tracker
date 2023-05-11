class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :course
      t.date :date
      t.integer :entry_fee
      t.boolean :pdga_members_only

      t.timestamps
    end
  end
end
