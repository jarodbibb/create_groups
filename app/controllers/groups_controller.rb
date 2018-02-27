class GroupsController < ApplicationController
  before_action :require_login
  def create
    @group = Group.new(name: makin_group[:name], description: makin_group[:description], created_by: current_user.first_name )
    
    if @group.save 
      redirect_to "/groups"
    else 
      flash[:notice] = @group.errors.full_messages
      redirect_to "/groups"
    end
  end
  def display
    @group = Group.find( params[:id])
    @members = Member.where(groups_id: params[:id])
    @part = Member.where(groups_id: params[:id]).where(users_id: current_user.id)
    # @testing = @members.include?(current_user.id)
    # puts "--------------", @testing, "=================="

  end

  def destroy
    @member = Member.where(groups_id: params[:id]).where(users_id: current_user.id)
  
    @member.each do |member|
    
     member.destroy
    end 
    @id = params[:id]
    redirect_to "/groups/#{@id}"
  end

  def leave
  end

  def join
    @members = Member.where(groups_id: params[:id])
    @member = Member.where(groups_id: params[:id]).where(users_id: current_user.id)
    if @member.length < 1
      @in  = Member.create(groups_id: params[:id], users_id: current_user.id)
    
    end 
      @id = params[:id]
    redirect_to "/groups/#{@id}"

  end
  def show
    @groups = Group.all
    
  end
  private 
  def makin_group 
    params.require(:group).permit(:name, :description)
  end
end
