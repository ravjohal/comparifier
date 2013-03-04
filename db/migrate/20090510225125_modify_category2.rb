class ModifyCategory2 < ActiveRecord::Migration
  class Category < ActiveRecord::Base; end
  def self.up
    add_column :categories, :parentCategoryId, :string
    add_column :categories, :isLeafCategory, :boolean
    add_column :categories, :isCategoryRoot, :boolean
    add_column :categories, :parentCategoryName, :string
    
#    cat = Category.find(2)
#    cat.parent_categoryId = "1"
#    cat.save
  end

  def self.down
    remove_column :categories, :parentCategoryId
    remove_column :categories, :isLeafCategory
    remove_column :categories, :isCategoryRoot
    remove_column :categories, :parentCategoryName
  end
end
