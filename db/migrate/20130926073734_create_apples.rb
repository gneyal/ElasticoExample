class CreateApples < ActiveRecord::Migration
  def change
    create_table :apples do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
