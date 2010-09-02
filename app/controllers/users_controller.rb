class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create    
    debugger
    
    params[:user][:user_type_ids].reject!{|ut_id| ut_id.blank?}
    
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        redirect_to @user
      else
        flash[:alert] = 'User was NOT created.'        
        format.html { render :action => "new" }
      end
    end
  end  
  
  def show
    @user = User.criteria.id([params[:id]])
  end
end
