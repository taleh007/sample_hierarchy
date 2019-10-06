class SiteMapController < ApplicationController
  def index
    render json: SitePoint.hash_tree_as_json, status: :ok
  end
end
