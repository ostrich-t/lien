class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :gender
      t.date :birth_info
      t.string :residence
      t.string :hobby
      t.string :job
      t.text :text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
