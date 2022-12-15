require 'rails_helper'

RSpec.describe Pig, type: :model do
  it "should validate name" do
    pig = Pig.create(breed: 'Teddy Guinea Pig',
      habits: 'Helping their human with their experiments',
      image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333')
    expect(pig.errors[:name]).to_not be_empty
  end
  it "should validate breed" do
    pig = Pig.create(name: 'Mike the Pig',
      habits: 'Helping their human with their experiments',
      image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333')
    expect(pig.errors[:breed]).to_not be_empty
  end
  it "should validate habits" do
    pig = Pig.create(name: 'Mike the Pig', breed: 'Teddy Guinea Pig', image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333')
    expect(pig.errors[:habits]).to_not be_empty
  end
  it "should validate image" do
    pig = Pig.create(name: 'Mike the Pig', breed: 'Teddy Guinea Pig', habits: 'Helping their human with their experiments')
    expect(pig.errors[:image]).to_not be_empty
  end
  it "should ensure habits is at least 10 characters long" do
    pig = Pig.create(name: 'Mike the Pig', breed: 'Teddy Guinea Pig', habits: 'Helping', image: 'https://www.istockphoto.com/es/foto/preparado-cuy-guinea-pig-gm497034064-78906333')
    expect(pig.errors[:habits]).to_not be_empty
  end
end



