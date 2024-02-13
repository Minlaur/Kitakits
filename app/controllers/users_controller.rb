class UsersController < ApplicationController

def show
  @sempai = User.find(params[:id]).sempai
end

end
