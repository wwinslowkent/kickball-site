require_relative "./team_data"

class Player
  attr_reader :name, :position, :team_name
  def initialize (name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end

  def self.all
    allplayers = []
    TeamData::ROLL_CALL.each do |team_name, roster|
      roster.each do |position, player|
        allplayers << Player.new(player, position, team_name)
      end
    end
    return allplayers
  end
end
