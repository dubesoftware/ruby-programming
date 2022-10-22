require_relative 'project'

class GrantProject < Project
  
  def remove_funds
    "Grant projects do not allow removal of funds."
  end
  
  def remove_from_funds
    "Grant projects do not allow removal of funds."
  end
end