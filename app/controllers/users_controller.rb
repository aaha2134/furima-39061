class UsersController < ApplicationController

  def show
    user=User.find(params[:id])
    @items = user.items
    @nickname = user.nickname


end
