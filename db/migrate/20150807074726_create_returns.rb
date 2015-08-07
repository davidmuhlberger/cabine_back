class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.integer :brand_id
      t.date :expected_date
      t.string :status
      t.date :send_date
      t.text :comment

      t.timestamps null: false
    end
  end
end
