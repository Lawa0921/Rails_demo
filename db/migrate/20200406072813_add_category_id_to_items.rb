class AddCategoryIdToItems < ActiveRecord::Migration[6.0]
  def change
    # add_column :items, :category_id, :integer 完全不知道為啥壞掉
    add_column :items, :category_id, :integer
  end
end
