class CreateDiscgolfers < ActiveRecord::Migration[7.0]
  def change
    create_table :discgolfers do |t|
      t.string :name
      t.integer :rating
      t.boolean :pdga_member

      t.timestamps
    end
  end
end
