class QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :edit, :update, :destroy]

  def start_quest
    @quests = Quest.find(params[:id])
    if !@quests.nil?
      current = CurrentQuest.where(:character => session[:character], :stat => 0).first
      if current.nil?
        new_current = CurrentQuest.new
        new_current.character = session[:character]
        new_current.quest = params[:id]
        new_current.stat = 0
        new_current.save
      else
        if current.quest.to_i != params[:id].to_i
          
          redirect_to({ :controller => 'npcs', :action => 'npc_list' }, :alert => 'vous devez finir votre quête en cours!')
        end
      end
    end
  end

  # GET /quests
  # GET /quests.json
  def index
    @quests = Quest.all
  end

  # GET /quests/1
  # GET /quests/1.json
  def show
  end

  # GET /quests/new
  def new
    @quest = Quest.new
  end

  # GET /quests/1/edit
  def edit
  end

  # POST /quests
  # POST /quests.json
  def create
    @quest = Quest.new(quest_params)

    respond_to do |format|
      if @quest.save
        format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
        format.json { render :show, status: :created, location: @quest }
      else
        format.html { render :new }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quests/1
  # PATCH/PUT /quests/1.json
  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.html { redirect_to @quest, notice: 'Quest was successfully updated.' }
        format.json { render :show, status: :ok, location: @quest }
      else
        format.html { render :edit }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1
  # DELETE /quests/1.json
  def destroy
    @quest.destroy
    respond_to do |format|
      format.html { redirect_to quests_url, notice: 'Quest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest
      @quest = Quest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_params
      params.require(:quest).permit(:npc_id, :name, :next)
    end
end
