class ItemController < ApplicationController
  before_action :authenticate_user!
  def new
    @item = Item.new
    @list = List.find(params[:list_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    item_params =params[:item]
    date = Item.package_date item_params
    if @item.update due_date: date, status: item_params[:status]
      flash[:notice] = "Item Updated"
      redirect_to item_path(@item)
    else
      render :new
    end
  end


  def edit
    @item = Item.find(params[:id])
  end

  def create
    list = List.find(params[:list_id])
    item_params = params[:item]
    date = Item.package_date item_params
    @item = list.items.new description: params[:item][:description], user_id: current_user.id, due_date: date
    if @item.save
      flash[:notice] = "Item Created"
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def list
    @list = List.find(params[:list_id])
    @items = @list.items.all
  end

  def index
    @items = current_user.items.all
  end




end
