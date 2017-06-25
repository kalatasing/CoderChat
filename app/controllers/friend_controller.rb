class FriendController < ApplicationController
  def index
    if params[:type] == "MY FRIEND"
      @friends = current_user.friend_list
    elsif params[:type] == "MY FRIEND REQUESTS"
      @friends = current_user.pending_friends
    else
      @friends = User.all
    end

  end

  def show
  end

  def add_friend
    f = User.find(params[:id])
    if current_user.id == f.id
      flash[:error] = "You cannot do self-friendship add "
      redirect_to friend_index_path(type: "MY FRIEND")
    else
      Friend.create(user_id: current_user.id, friend_id: f.id )
      flash[:success] = "Add friend successful for #{f.first_name} #{f.last_name}! Waiting for him/her to accept "
      redirect_to friend_index_path(type: "MY FRIEND")
    end
  end

  def friend_deny
    f = User.find(params[:id])
    unfriend = Friend.find_by(friend_id: f.id)
    unfriend[:status] = false
    unfriend.save
    flash[:success] = "Successful Un Friend #{f.first_name} #{f.last_name}"
    redirect_to friend_index_path(type: "MY FRIEND REQUESTS")
  end


  def un_friend
    f = User.find(params[:id])
    a = Friend.find_by(user_id: f.id, friend_id: current_user.id)
    b = Friend.find_by(user_id: current_user.id, friend_id: f.id)

    if !a.nil?
      a.destroy
    elsif !b.nil?
      b.destroy
    end

    flash[:success] = "Successful Un Friend #{f.first_name} #{f.last_name}"
    redirect_to friend_index_path(type: "MY FRIEND")
  end

  def friend_accept
    f = User.find(params[:id])
    a = Friend.find_by(user_id: f.id, friend_id: current_user.id)
    a.status = true
    a.save

    flash[:success] = "Successful Accept Friend for #{f.first_name} #{f.last_name}"
    redirect_to friend_index_path(type: "MY FRIEND REQUESTS")
  end
end
