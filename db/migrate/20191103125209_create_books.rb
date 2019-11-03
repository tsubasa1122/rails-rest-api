class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :imate
      t.string :author
      t.string :title
      t.string :string

      t.timestamps
    end
  end
end
