class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.string :gender
      t.date :birth_date
      t.string :cell_phone

      t.timestamps
    end
  end
end
