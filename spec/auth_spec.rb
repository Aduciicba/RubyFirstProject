require 'spec_helper'


  describe Auth do
=begin
  before :each do
    @auth = Auth.new "Username", "secure_password"
  end
  describe "#new" do
    it 'init Auth object' do
      @auth.should be_an_instance_of Auth
    end
  end
=end

  describe '#check_authorization' do
    it 'valid auth' do
      @auth = Auth.new 'user3', '3'
      @auth.check_authorization.should be_true
    end
  end

  describe '#check_authorization' do
    it 'not valid auth' do
      @auth = Auth.new 'blablabla', 'blablabla'
      @auth.check_authorization.should be_false
    end
  end
end