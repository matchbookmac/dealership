require('rspec')
require('dealership')

describe('Dealership') do
  before() do
    Dealership.clear()
  end

  describe('#name') do
    it('returns the name of the dealership') do
      test_dealership = Dealership.new("buddys")
      expect(test_dealership.name()).to(eq("buddys"))
    end
  end

  describe('#save') do
    it('saves the new dealership to an array of Dealerships') do
      test_dealership = Dealership.new("buddys")
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

  describe('#all') do
    it('returns an empty array if there are no dealerships') do
      expect(Dealership.all()).to(eq([]))
    end
    it('returns an array of the dealerships present') do
      test_dealership = Dealership.new("buddys")
      test_dealership.save()
      test_dealership_2 = Dealership.new("guy's")
      test_dealership_2.save()
      expect(Dealership.all()).to(eq([test_dealership, test_dealership_2]))
    end
  end

  describe('#clear') do
    it('will clear the dealerships array so that #all returns an empty array') do
      test_dealership = Dealership.new("buddys")
      test_dealership.save()
      test_dealership_2 = Dealership.new("guy's")
      test_dealership_2.save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end
  describe('#id') do
    it('will identify a dealership by its id') do
      test_dealership = Dealership.new("buddys")
      test_dealership.save()
      test_dealership_2 = Dealership.new("guy's")
      test_dealership_2.save()
      expect(test_dealership_2.id()).to(eq(2))
    end
  end
  describe('find') do
    it('finds a dealership based on its id') do
      test_dealership = Dealership.new("buddys")
      test_dealership.save()
      test_dealership_2 = Dealership.new("guy's")
      test_dealership_2.save()
      expect(Dealership.find(2)).to(eq(test_dealership_2))
    end
  end

  describe('#cars') do
    it('returns array of cars for dealership') do
      test_dealership = Dealership.new("buddys")
      test_dealership.save()
      expect(test_dealership.cars()).to(eq([]))
    end
  end
end
