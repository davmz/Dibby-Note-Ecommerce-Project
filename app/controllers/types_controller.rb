class TypesController < ApplicationController
  add_breadcrumb "Types", :types_path

  def index
    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])
    add_breadcrumb @type.name, type_path(@type.id)
  end
end
