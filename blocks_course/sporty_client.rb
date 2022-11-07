require_relative 'utilities'

class SportyClient
  def post(message)
    raise "Not signed in!" unless @user
    # post message to remote service
    puts "#{@user} posted message: #{message}"
  end

  def timeline
    raise "Not signed in!" unless @user
    # get timeline from remote service
    puts "#{@user} fetched timeline..."
  end

  def sign_in(user)
    # sign in to remote service
    @user = user
    puts "#{user} signed in."
  end

  def sign_out(user)
    # sign out of remote service
    puts "#{user} signed out!"
  end
end

separator = Utilities::separator
client = SportyClient.new

puts "Sequence of steps for posting messages and fetching the timeline:"
puts separator
client.sign_in("broncos_fan")
client.post("Ready for the new season...")
client.post("Broncos are going all the way!")
client.timeline
client.sign_out("broncos_fan")
puts separator