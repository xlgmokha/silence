=begin
 Write a program that prints the numbers from 1 to 100.
 But for multiples of three print "Fizz" instead of the
 number and for the multiples of five print “Buzz”. For
 numbers which are multiples of both three and five
 print "FizzBuzz".
=end

def fizz_buzz(n)
end

describe "FizzBuzz" do
  it "returns each number" do
    [1, 2, 4, 7, 8].each do |n|
      expect(fizz_buzz(n)).to eql(n)
    end
  end

  xit "returns 'Fizz'" do
    expect(fizz_buzz(3)).to eql("Fizz")
  end

  xit "returns 'Buzz'" do
    expect(fizz_buzz(5)).to eql("Buzz")
  end

  xit "returns 'FizzBuzz'" do
  end
end
