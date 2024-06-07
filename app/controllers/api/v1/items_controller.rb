class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:destroy, :update, :show]
  def index
    @items = Item.all

    render json: {status:'success', data: {items: @items}}
  end

  def show
    render json: {status: 'success', data: {item: @item}}
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: {status: 'success', data: {item: @item}}, status: :created
    else
      render json: {status: 'fail', error: {message: "Couldn't create item", error: @item.errors}}, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: {status: 'success', data: {item: @item}}
    else
      render json: {status: 'fail', error: {message: "Couldn't update item", errors: @item.errors}}, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {status:'fail', error: {message: 'Item not found'}}, status: :not_found
  end

  def item_params
    params.require(:item).permit(:name, :capacity_unit, :capacity, :bottles_number)
  end
end
