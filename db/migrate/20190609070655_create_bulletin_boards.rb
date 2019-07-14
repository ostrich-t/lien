class CreateBulletinBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :bulletin_boards do |t|
      t.text :text
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
