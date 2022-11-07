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
  
  def as_signed_in_user(user)
    sign_in(user)
    yield
    sign_out(user)
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

puts "Test as_signed_in_user method:"
puts separator
client.as_signed_in_user("broncos_fan") do
  client.post("Ready for the new season...")
  client.post("Broncos are going all the way!")
  client.timeline
end
puts separator