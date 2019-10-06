class CreateSitePointHierarchies < ActiveRecord::Migration[6.0]
  def change
    create_table :site_point_hierarchies do |t|
      t.integer  :ancestor_id, null: false
      t.integer  :descendant_id, null: false
      t.integer  :generations, null: false
    end

    add_index :site_point_hierarchies, %i[ancestor_id descendant_id generations],
              unique: true, name: 'site_point_anc_desc_gen_idx'

    add_index :site_point_hierarchies, %i[descendant_id],
              name: 'site_point_desc_idx'
  end
end
