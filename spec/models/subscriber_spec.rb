require 'rails_helper'

RSpec.describe Subscriber, :type => :model do
  subject { described_class.new(
      name: "Pippo",
      email: "pippo@pluto.it"
      ) }

    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without a username" do
        subject.name = nil
        expect(subject).to_not be_valid
    end
    
    it "username should have a minimum length" do
        subject.name = "sh"
        expect(subject).to_not be_valid
    end
    
    it "email should have a minimum length" do
        subject.email = "a@b.c"
        expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
        subject.email = nil
        expect(subject).to_not be_valid
    end
    
     it "name should not be too long" do
        subject.name = "a" * 51
        expect(subject).to_not be_valid
    end
    
    it "email should not be too long" do
        subject.email = "a" * 244 + "@example.com"
        expect(subject).to_not be_valid
    end

end