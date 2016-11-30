require_relative "./team_data"

class Team
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def self.all
    allteams = []
    TeamData::ROLL_CALL.each do |team_name, roster|
      allteams << Team.new(team_name)
    end
    return allteams
  end

  def players
    players = []
    TeamData::ROLL_CALL.each do |team_name, roster|
      if team_name == @name
        roster.each do |position, name|
          players << Player.new(name, position, team_name)
        end
      end
    end
    return players
  end


end
