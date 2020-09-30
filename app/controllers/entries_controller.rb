class EntriesController < ApplicationController

  def index
    @entries = Entry.where(user_id: @user.id)
    render json: @entries
  end

  def show
    @entry = Entry.find(params[:id])
    render json: @entry
  end

  def create
    @entry = Entry.create(
      item1: params[:item1],
      item2: params[:item2],
      item3: params[:item3],
      user_id: @user.id
    )
    render json: @entry
  end

end