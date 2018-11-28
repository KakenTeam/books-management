class RemoveSlugFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :slug, :string
  end
end
