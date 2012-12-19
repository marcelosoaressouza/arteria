class CreateRsses < ActiveRecord::Migration
  def change
    create_table :rsses do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
