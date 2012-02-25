require File.join(File.expand_path(File.dirname(__FILE__)),%w[.. spec_helper])

require 'site'

describe Site,"when providing its site_payload" do
  let(:config){{"new_value" => "Hey",'permalink' => "Hello"}}
  let(:sut){Site.new(config)}

  before (:each) do
    @payload = sut.site_payload
  end

  it "should provide access to all of the details in the original configuration hash" do
    @payload["site"].has_key?("new_value").should be_true
  end
  
end


