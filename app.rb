require "rubygems"
require "bundler/setup"

require "sinatra"

require "boilerpipe-1.2.0.jar"
require "lib/nekohtml-1.9.13.jar"
require "lib/xerces-2.9.1.jar"

require "json"

include Java 
java_import java.net.URL
$CLASSPATH << "lib"

get '/extract' do
  content_type :json
  
  url = java.net.URL.new(params[:url])

  Java::DeL3sBoilerpipeExtractors::ArticleExtractor::INSTANCE.getText(url)
end