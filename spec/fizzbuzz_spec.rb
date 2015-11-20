=begin
 Write a program that prints the numbers from 1 to 100.
 But for multiples of three print "Fizz" instead of the
 number and for the multiples of five print “Buzz”. For
 numbers which are multiples of both three and five
 print "FizzBuzz".
=end
class FizzBuzz
  def run(input)
  end
end

describe "FizzBuzz" do
  subject { FizzBuzz.new }

  context "when the input is a multiple of 3" do
    it "returns 'Fizz'" do
      (1..10).each do |n|
        result = subject.run(n*3)
        expect(result).to include("Fizz")
      end
    end
  end

  context "when the input is a multiple of 5" do
    xit "returns 'Buzz'" do
      (1..10).each do |n|
        result = subject.run(n*5)
        expect(result).to include("Buzz")
      end
    end
  end

  context "when the input is not a multiple of 3 or 5" do
    xit 'returns the input' do
    end
  end
end
