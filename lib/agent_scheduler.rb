require 'cronedit'


class Agent 

  include CronEdit

  def initialize

    # cm = CronEdit::Crontab.new
    # cm.add 'agent1',{:minute=>1,:command=>'echo 42'}

    # Crontab.Add :agent1, {:minute=>5,:command =>'ruby ./lib/api_twit.rb' }

    Crontab.Add :agent1, {:minute=>1,:command =>'echo 42'}

    # Crontab.Add :agent2, {:minute=>1,:command => 'echo Hello'}
    # p Crontab.

    # cm.commit
  end
end

agent = Agent.new