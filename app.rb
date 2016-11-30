require "sinatra"
require "erb"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"


set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  "<h1>The LACKP Homepage<h1>"

end
allteams = Team.all

teams = <<-ERB
<h1>TEAMS</h1>

<% allteams.each do |team| %>
  <ul>
<a href="/teams/<%= team.name %>"> <li><%= team.name %> </li></a>
</ul>
<% end %>
ERB
teamserb = ERB.new(teams)

get "/teams" do
  teamserb.result
end

get "/teams/:team_name" do
  @team_name = params[:team_name]
  erb :players
end

get "/positions" do
  erb :positions
end

get "/positions/:position_name" do
  @position_name = params[:position_name]
  erb :eachposition
end
