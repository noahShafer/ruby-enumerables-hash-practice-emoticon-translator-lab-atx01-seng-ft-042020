# require modules here
require 'yaml'

def load_library
  file = YAML.load_file('lib/moticons.yml')
  file.reduce({}) do |memo, (key, value)| 
    memo[key] = {}
    value.each_with_index {|e, i| i == 0 ? memo[key][:english] = e : memo[key][:japanese] = e }
    memo
  end
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end
p load_library