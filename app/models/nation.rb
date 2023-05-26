class Nation
  attr_reader :name, :total_members, :members

  def initialize
    @name = "Fire"
    @total_members = 100
    @members = [Member.new]
  end
end