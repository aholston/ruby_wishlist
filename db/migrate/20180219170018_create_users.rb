class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.date :date_hired

      t.timestamps null: false
    end
  end
end
