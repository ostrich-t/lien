class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.string  :uid, unique: true
      t.string  :provider, unique: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
