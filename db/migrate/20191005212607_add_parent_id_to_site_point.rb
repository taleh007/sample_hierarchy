class AddParentIdToSitePoint < ActiveRecord::Migration[6.0]
  def change
    add_column :site_points, :parent_id, :integer
  end
end
