class SitePoint < ApplicationRecord
  has_closure_tree order: 'path DESC', dependent: :delete_all, name_column: :path

  validates :name, presence: true
  validates :path, presence: true, if: :parent_id

  class << self
    def hash_tree_as_json(options = {})
      recursive_extractor = lambda do |node, childrens_map, options = {}|
        options[:absolute_path] ||= []
        options[:absolute_path] += [node.path]
        options[:view_id]       ||= []
        options[:view_id]       += [node.name.gsub(/\s+/, ?_).downcase]

        data = {
          name: node.name,
          absolute_path: options[:absolute_path].join(?/),
          view_id: options[:view_id].join(?.),
          leaf: false,
        }

        data[:children] = childrens_map.each_with_object([]) do |(kk, vv), memo|
          memo << recursive_extractor.call(kk, vv, options.dup)
        end

        data[:leaf] = true if  data[:children].blank?

        data
      end

      hash_tree(options).each_with_object({ data: [] }) do |(node, childrens_map), json|
        json[:data] << recursive_extractor.call(node, childrens_map)
      end.as_json
    end
  end
end
