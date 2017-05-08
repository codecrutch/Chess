require 'byebug'

class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    boss.employees << self unless boss.nil?
  end

  def boss=(boss)
    @boss = boss
    boss.employees << self
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary)
    super(name, title, salary)
    @employees = []
  end

  def boss=(boss)
    @boss = boss
    boss.employees << self
    self.employees.each do |emp|
      boss.employees << emp
    end
  end

  def bonus(multiplier)
    employees.map(&:salary).reduce(:+) * multiplier
  end
end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("Ned", "Founder", 1_000_000)
  shawna = Employee.new("Shawna", "TA", 12_000)
  david = Employee.new("David", "TA", 10_000)
  darren = Manager.new("Darren", "TA Manager", 78_000)

shawna.boss = darren
david.boss = darren
darren.boss = ned

  puts ned.bonus(5)
  puts darren.bonus(4)
  puts david.bonus(3)
end
