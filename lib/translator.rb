# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  library=YAML.load_file(file_path)
  
  hash= {"get_meaning" => {}, "get_emoticon" => {}}
  
  library.each{|meaning,emoticons|
    hash["get_meaning"][emoticons[1]]=meaning
    hash["get_emoticon"][emoticons[0]]=emoticons[1]
  }
  hash
end

def get_japanese_emoticon(file_path,emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].include?(emoticon)
    libary["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path,emoticon)
  library = load_library(file_path)
  if library["get_meaning"].include?(emoticon)
    libary["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end