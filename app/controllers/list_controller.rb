class ListController < ApplicationController
  before_action :authenticate_user!
  
  def create
    unless current_user.lists.find_by(title: params[:list][:title])
      @list = current_user.lists.new title: params[:list][:title]
      if @list.save
        flash[:notice] = "List Created"
        redirect_to list_path(@list)
      else
        render :new
      end
    else
      flash[:alert] ="List already exists"
      redirect_to root_path
    end
  end

  def show
    @list =List.find(params[:id])
  end

  def index
    @lists = current_user.lists.all
  end
end
