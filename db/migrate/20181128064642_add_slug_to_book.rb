class AddSlugToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :slug, :string
  end
end
