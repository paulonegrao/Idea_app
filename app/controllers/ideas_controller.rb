class IdeasController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  before_action(:find_idea, {only: [:show, :edit, :update, :destroy]})

  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @idea = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea      = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      redirect_to(idea_path(@idea), notice: "Idea created!")
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
    redirect_to root_path, alert: "Access denied." unless can? :edit, @idea
  end

  def update
    if @idea.update(idea_params)
      redirect_to idea_path(@idea), notice: "Idea updated!"
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    flash[:notice] = "Idea deleted"
    redirect_to ideas_path
  end

  private

  def idea_params

    params.require(:idea).permit([:title, :body, {tag_ids: []}])

  end

  def find_idea
    @idea = Idea.find params[:id]
  end

  def authorize
    redirect_to root_path, alert: "Access denied!" unless can? :manage, @idea
  end

end
