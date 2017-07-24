require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new(
      name: "Pippo",
      email: "pippo@pluto.it",
      password: "paperino",
      password_confirmation: "paperino",
      question: 2,
      answer: "topolino"
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
    
    it "is not valid without password" do
        subject.password = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid if password and confirmation are different" do
        subject.password = "aaaaaaaa"
        subject.password_confirmation = "bbbbbbbb"
        expect(subject).to_not be_valid
    end

    it "is not valid without a question" do
        subject.question = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid if question is not in range [1-4]" do
        subject.question = 0
        expect(subject).to_not be_valid
    end
    
    it "is not valid if question is not in range [1-4]" do
        subject.question = 5
        expect(subject).to_not be_valid
    end
    
    it "is not valid if question is not in range [1-4]" do
        subject.question = 'a'
        expect(subject).to_not be_valid
    end
    
    it "is not valid without an answer" do
        subject.answer = nil
        expect(subject).to_not be_valid
    end
    
    it "password should have a minimum length" do
        subject.password = "short"
        subject.password_confirmation = "short"
        expect(subject).to_not be_valid
    end
    
    it "email addresses should be unique" do
        subject.email = User.first.email
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

    it "email validation should accept valid addresses - user@example.com" do
        subject.email = "user@example.com"
        expect(subject).to be_valid
    end
    
    it "email validation should accept valid addresses - USER@foo.COM" do
        subject.email = "USER@foo.COM"
        expect(subject).to be_valid
    end
    
    it "email validation should accept valid addresses - A_US-ER@foo.bar.org" do
        subject.email = "A_US-ER@foo.bar.org"
        expect(subject).to be_valid
    end
    
    it "email validation should accept valid addresses - first.last@foo.jp" do
        subject.email = "first.last@foo.jp"
        expect(subject).to be_valid
    end
    
    it "email validation should accept valid addresses - alice+bob@baz.cn" do
        subject.email = "alice+bob@baz.cn"
        expect(subject).to be_valid
    end
    
    it "email validation should reject invalid addresses - user@exemple,com" do 
        subject.email = "user@exemple,com"
        expect(subject).to_not be_valid
    end
    
    it "email validation should reject invalid addresses - user_at_foo.org" do 
        subject.email = "user_at_foo.org"
        expect(subject).to_not be_valid
    end
    
    it "email validation should reject invalid addresses - user.name@example." do 
        subject.email = "user.name@example."
        expect(subject).to_not be_valid
    end
    
    it "email validation should reject invalid addresses - foo@bar_baz.com" do 
        subject.email = "foo@bar_baz.com"
        expect(subject).to_not be_valid
    end
    
    it "email validation should reject invalid addresses - foo@bar+baz.com" do 
        subject.email = "foo@bar+baz.com"
        expect(subject).to_not be_valid
    end
    
end