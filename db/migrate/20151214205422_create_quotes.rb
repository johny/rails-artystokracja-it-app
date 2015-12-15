class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|

      t.text :content
      t.boolean :published, null: false, default: false
      t.timestamps null: false
    end
  end
end
