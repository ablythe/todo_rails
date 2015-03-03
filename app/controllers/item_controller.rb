class ItemController < ApplicationController
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    list = List.find(params[:list_id])
    item_params = params[:item]
    date = DateTime.new(item_params["due_date(1i)"].to_i,item_params["due_date(2i)"].to_i, item_params["due_date(3i)"].to_i)
    @item = list.items.new description: params[:item][:description], user_id: current_user.id, due_date: date
    if @item.save
      flash[:notice] = "Item Created"
      redirect_to item_path(@item)
    else
      render :new
    end
  end




end
