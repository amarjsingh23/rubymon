class MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy, :team]
  before_action :get_monters, only: [:index, :teams]

  def index
  end

  def show
  end

  def new
    @monster = Monster.new
  end

  def edit
  end

  def create
    @monster = current_user.monsters.new(monster_params)

    respond_to do |format|
      if @monster.save
        format.html { redirect_to @monster, notice: 'Monster was successfully created.' }
        format.json { render :show, status: :created, location: @monster }
      else
        format.html { render :new }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @monster.update(monster_params)
        format.html { redirect_to @monster, notice: 'Monster was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster }
      else
        format.html { render :edit }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @monster.destroy
    respond_to do |format|
      format.html { redirect_to monsters_url, notice: 'Monster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def team
  end

  def teams
    @unassigned_monsters = @monsters.where(team_id: nil)
    @team1_monsters = @monsters.where(team_id: 1)
    @team2_monsters = @monsters.where(team_id: 2)
    @team3_monsters = @monsters.where(team_id: 3)
  end

  private
    def set_monster
      @monster = Monster.find(params[:id])
    end

    def get_monters
      @monsters = current_user.monsters
    end

    def monster_params
      params.require(:monster).permit(:name, :power, :monster_type_id, :team_id)
    end
end
