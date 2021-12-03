class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :sentence
      t.string :answer

      t.timestamps
    end
  end
end
