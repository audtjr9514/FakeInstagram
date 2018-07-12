class CreateDbs < ActiveRecord::Migration
  def change
    create_table :dbs do |t|
      t.string :title
      t.string :content
      t.string :img_url, default: ""
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
