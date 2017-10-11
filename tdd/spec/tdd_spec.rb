require 'rspec'
require 'tdd'

RSpec.describe "#my_uniq" do
  let(:array) { [1, 2, 1, 3, 3] }
  # array = [1, 2, 1, 3, 3]
  it "removes duplicate elements from the array" do
    # array = [1, 2, 1, 3, 3]
    expect(my_uniq(array)).to eq([1, 2, 3])
  end
end

describe "#two_sum" do
  context "there are no pairs that sum to 0" do
    array = [1, 2, 3]
    it "returns an emtpy array" do
      expect(two_sum(array)).to be_empty
    end
  end

  context "there are pairs of elements that sum to 0" do
    let(:array) { [-1, 0, 2, -2, 1] }
    it "returns an array of arrays" do
      expect(two_sum(array)[0]).to be_a(Array)
    end
    it "returns the pairs of indices that sum to 0" do
      expect(two_sum(array)).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "#my_transpose" do
  context "original array is empty" do
    array = []
    it "return an empty array" do
      expect(my_transpose(array)).to be_empty
    end
  end

  context "original array is NOT empty" do
    it "transposes the matrix from rows to columns" do
      rows = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      cols = [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ]
      expect(my_transpose(rows)).to eq(cols)
    end
  end
end

describe "#stock_picker" do
  let(:stock_prices) { [4.67, 3.0, 9.2, 0.35, 1.2, 4.7, 15.5, 3.1] }

  it "raises an error if array input length less than 2" do
    expect { stock_picker([1.13]) }.to raise_error("need at least two days")
  end
  it "returns a pair of integers in an array" do
    expect(stock_picker(stock_prices)).to be_a(Array)
  end

  it "returns the indices of days that are most profitable to buy and sell" do
    expect(stock_picker(stock_prices)).to eq([3, 6])
  end
end
