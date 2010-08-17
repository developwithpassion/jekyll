require File.join(File.expand_path(File.dirname(__FILE__)),%w[.. spec_helper])

require 'post'

describe Post,"when determining if it should be posted" do
  context "and it was created on or before the current date" do
    before do
     @site = Object.new
     @source = "source"
     @dir = "blah"
     @post_time = Time.mktime(2010,1,1,1,1)
     @name = '2010-01-01_09-00-some-real-post.markdown'

     stub(File).join(@source,@dir,'_posts').return("blah")
     stub(File).join {"blah"}
     stub(@site).post_defaults.returns(Hash.new)

     @post = Post.new(@site,@source,@dir,@name)
    end
    it "should be true" do
      false.should == true   
    end
  end
end

