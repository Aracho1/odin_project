
def caesar_cipher(string, number)
  alphabet_capital = [*"A".."Z"]
  alphabet_small = [*"a".."z"]

  # 1. split the string into words
  words = string.split(" ")
  output = []

  words.each do |word|
    letters = word.split("")
    letters.map! do |letter|
      if !((letter.ord >= 65 && letter.ord <= 90) || (letter.ord >=97 && letter.ord <= 122))
        letter
      elsif (letter == letter.upcase) == true
        key = (letter.ord - 65 + number) % 26
        letter = alphabet_capital[key]
      elsif (letter == letter.upcase) == false
        key = (letter.ord - 97 + number) % 26
        letter = alphabet_small[key]
      end
    end

    output << letters.join("")
  end

  output.join(" ")
end

caesar_cipher("What a string!", 5)
