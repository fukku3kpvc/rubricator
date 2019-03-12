class NodesController < ApplicationController
  before_action :set_node, except: %I[new create index]
  before_action :authenticate_user!, except: %I[index show]

  def index
    @nodes = Node.all
  end

  def show; end

  def new
    @node = Node.new(parent_id: params[:parent_id])
    # @node.image = params[:file]
  end

  def create
    @node = Node.new(node_params)
    if @node.save
      redirect_to nodes_path, notice: 'A new node was successfully saved'
    else
      flash[:alert] = 'An error occurred while saving new node'
      render :new
    end
  end

  def edit; end

  def update
    if @node.update node_params
      redirect_to nodes_path, notice: 'The node was successfully updated'
    else
      flash[:alert] = 'An error occurred while updating node'
      render :edit
    end
  end

  def destroy
    @node.destroy
    if @node.destroyed?
      flash[:notice] = 'The node was successfully deleted'
    else
      flash[:alert] = 'An error occurred while deleting node'
    end
    redirect_to nodes_path
  end

  private

  def node_params
    params.require(:node).permit(:title, :description, :image, :parent_id, :remove_image)
  end

  def set_node
    @node = Node.find params[:id]
  end
end
