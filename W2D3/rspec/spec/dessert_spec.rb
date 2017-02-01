require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "chef") }

  subject(:dessert) do
    Dessert.new("Cake", 12, chef)
  end

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "a", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("flour")
      expect(dessert.ingredients).to include('flour')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("Milk")
      dessert.add_ingredient("Flour")
      dessert.add_ingredient("Sugar")
      dessert.add_ingredient("Water")
      expect(dessert.mix!).to_not eq(["Milk", "Flour", "Sugar", "Water"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(3)
      expect(dessert.quantity).to_not eq(12)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { desset.eat(13) }.to raise_error
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef chef the Great Baker")
      expect(dessert.serve).to include(chef.name)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake) { dessert }
      expect(chef).to receive(:bake)
      dessert.make_more
    end
  end
end
