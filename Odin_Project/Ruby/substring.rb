def substrings(string, dictionary)
  count = Hash.new(0)
  string.downcase!
  dictionary.map{ |word| count[string.match(word)[0]] = string.scan(word).length if string.match(word) != nil }
  count
end
