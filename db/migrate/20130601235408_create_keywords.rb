class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.integer "moc_code_id"
      t.string "keyword"
      t.timestamps
    end
  end
end
