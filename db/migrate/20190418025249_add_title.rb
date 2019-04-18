class AddTitle < ActiveRecord::Migration[5.2]
  def change
    add_column :counts, :title, :string
  end
end
