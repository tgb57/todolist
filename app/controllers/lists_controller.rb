class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  include SessionsHelper
  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
	@list = List.includes([:tasks]).find(params[:id])
	@task = Task.new
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  def list_params
    params.require(:list).permit(:title)
  end
  # POST /lists.json
  def create

	    #x = list_params.update({user_id: current_user.id})
	    #list_params['user_id'] = current_user.id
	    @list = List.new(list_params)
	    @list.user_id = current_user.id
	    @list.save
	    #puts '******'
	    #puts list_params
	    #@list = List.create(list_params)
	    redirect_to @list
	  

#    respond_to do |format|
#    @list = List.new(list_params)
#	x = list_params.update({user_id: current_user.id})
#	    @list = List.create(list_params)
#      if @list.save
#        format.html { redirect_to @list, notice: 'List was successfully created.' }
#        format.json { render :show, status: :created, location: @list }
#      else
#        format.html { render :new }
#        format.json { render json: @list.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:user_id, :title)
    end
end
