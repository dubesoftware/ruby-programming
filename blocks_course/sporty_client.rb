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