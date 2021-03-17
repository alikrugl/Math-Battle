# Expression class that include random expression to calculate and the answer to it
class Expression
  attr_reader :question, :answer

  OPERATIONS = [:+, :-]

  def initialize
    num1 = rand(1...100)
    num2 = rand(1...100)
    num3 = rand(1...100)
    operation1 = OPERATIONS.sample
    operation2 = OPERATIONS.sample
    @question = "#{num1} #{operation1} #{num2} #{operation2} #{num3} ="
    @answer = num1.send(operation1, num2).send(operation2, num3)
  end
end