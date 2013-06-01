class CreateMocCodes < ActiveRecord::Migration
  def change
    create_table :moc_codes do |t|
      t.string "moc_code"
      t.string "dol_code"
      t.string "name" 
      t.timestamps
    end
  end
end
