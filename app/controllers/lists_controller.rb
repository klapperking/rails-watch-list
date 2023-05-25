class ListsController < ApplicationController
  before_action :set_task, only: %i[show destroy]

  def index
    @lists = List.all
  end

  def show; end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to(lists_path)
  end

  def destroy
    @list.destroy
    redirect_to(lists_path, status: :see_other)
  end

  protected

  def set_task
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(%i[name])
  end
end
