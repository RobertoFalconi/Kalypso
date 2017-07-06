class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.boolean :suspended

      t.timestamps
    end
  end
end
