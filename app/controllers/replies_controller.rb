class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  def check_reply
    
    reply = Reply.find(params[:id])
    if !reply.nil?
      current = CurrentQuest.where(:quest => reply.question.quest_id, :character => session[:character], :stat => 0).first
      if !current.nil?
        
        if reply.bool === 1
          quest = Quest.find(reply.question.quest_id)
          current.stat = 1
          current.save
          
          if quest.next != 0
            current = CurrentQuest.new
            
            current.quest = quest.next
            current.character = session[:character]
            current.stat = 0
            current.save
            redirect_to({ :controller => 'quests', :action => 'start_quest', :id => quest.next}, :notice => 'bien joué!')
          else
            character = Character.find(session[:id])
            if character.exp + 100 >= 200
              character.level = character.level + 1
              character.exp = character.exp + 100 - 200
            else
              character.exp = character.exp + 100
            end
            character.skill = character.skill + 1
            character.save
            redirect_to({ :controller => 'npcs', :action => 'npc_list' }, :notice => 'bien joué! vous avez gagné 100xp!')
          end
        else
          redirect_to({ :controller => 'battle', :action => 'index'})
        end
      else
        redirect_to({ :controller => 'home', :action => 'index' }, :alert => 'Tricheur!')
      end
    end
  end
  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(reply_params)

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @reply, notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:question_id, :reply, :bool)
    end
end
