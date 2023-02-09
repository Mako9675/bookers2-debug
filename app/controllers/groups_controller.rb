class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def new
    @group = Group.new
    
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user
    if @group.save
      redirect_to groups_path
    else
      render :new
  end

  def index
    @groups = Group.all
    @user = current_user
    @book = Book.new
  end

  def show
    @group = Group.find(params[:id])
    @user = current_user
    @book = Book.new
  end

  def edit
    @group = Group.find(params[:id])
    @group.owner_id = current_user
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
  end
  
  private
    def group_params
      params.require(:book).permit(:name, :introduction, :group_image)
      
    def ensure_correct_user
      @group = Group.find(params[:id])
      unless @group.owner_id == current_user.id
        redirect_to groups_path
end
