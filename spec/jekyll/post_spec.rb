require File.join(File.expand_path(File.dirname(__FILE__)),%w[.. spec_helper])

require 'post'

describe Post,"when determining if it should be posted" do
  before do
     @site = Object.new
     @source = "source"
     @dir = "blah"
     @name = '2010-01-01_09-00-some-real-post.markdown'

     stub(File).join {"blah"}
     stub(File).read {"this is the content"}
     stub(@site).post_defaults.returns(Hash.new)
  end

  context "and it was created on or before the current date" do
    before do
     @current_time = Time.mktime(2010,1,1,9,0)
     stub(Time).now.returns(@current_time)
     @post = Post.new(@site,@source,@dir,@name)
    end

    it "should be true" do
      @post.can_be_posted.should be_true
    end

    context "but it is not published" do
       before do
         stub(@post).published.returns(false)
       end
       it "should not be posted" do
          @post.can_be_posted.should be_false 
       end
    end
  end

  context "and it has a post date greater than the current date" do
    before do
     @current_time = Time.mktime(2009,2,1,9,0)
     stub(Time).now.returns(@current_time)
     @post = Post.new(@site,@source,@dir,@name)
    end

    it "should be false" do
       @post.can_be_posted.should be_false 
    end
  end
end


