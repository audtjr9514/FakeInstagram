class CreateDbsHashtags < ActiveRecord::Migration
  def change
    create_table :dbs_hashtags do |t|
      t.integer :db_id
      t.integer :hashtag_id
    end
  end
end
