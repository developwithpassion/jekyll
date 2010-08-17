require File.join(File.dirname(__FILE__), *%w[.. lib jekyll])

Dir.chdir(File.join(File.dirname(__FILE__),%w[.. lib])) do
    Dir.glob("*").each do |lib| 
        $:.unshift File.expand_path(lib)
    end
end

include Jekyll

Spec::Runner.configure do |config|
 config.mock_with :rr
end
