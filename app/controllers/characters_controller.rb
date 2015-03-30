class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def select_character
    if request.post?
      character = Character.where(user_id: session[:id], id: params[:id]).first
      session[:character] = character.id
      redirect_to({ :controller => 'characters', :action => 'my_characters' }, :notice => character.name + ' selectionné!')
    end
  end
    
  def my_characters
    @characters = User.find(session[:id])
    @characters = @characters.characters
  end
  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    
    if (character_params[:atk].to_i + character_params[:pv].to_i + character_params[:def].to_i) == 30
      @character = Character.new(character_params)
      if session[:id]
        @character.user_id = session[:id]
      end
      respond_to do |format|
        if @character.save
          if session[:role] === 0
            format.html { redirect_to action: 'my_characters', notice: 'Character was successfully created.' }
          else
            format.html { redirect_to @character, notice: 'Character was successfully created.' }
            format.json { render :show, status: :created, location: @character }
          end
        else
          format.html { render :new }
          format.json { render json: @character.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to({ :action=>'new' }, :alert => "Les 30 points ne sont pas correctement attribués")
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:user_id, :name, :pv, :atk, :def)
    end

  end
