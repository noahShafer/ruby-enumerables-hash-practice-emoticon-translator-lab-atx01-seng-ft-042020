# require modules here
require 'yaml'

def load_library(path)
  file = YAML.load_file(path)
  file.reduce({}) do |memo, (key, value)| 
    memo[key] = {}
    value.each_with_index {|e, i| i == 0 ? memo[key][:english] = e : memo[key][:japanese] = e }
    memo
  end
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  res = ""
  emoticons.each {|pair| 
    res = pair[1][:japanese] if pair[1][:english] == emoticon
    break if res != ""
  }
  if res != ""
    return res
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  emoticons = load_library(path)
  res = ""
  emoticons.each {|pair| 
    res = pair[0] if pair[1][:japanese] == emoticon
    break if res != ""
  }
  if res != ""
    return res
  else
    return "Sorry, that emoticon was not found"
  end
end