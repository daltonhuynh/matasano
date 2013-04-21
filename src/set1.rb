require 'base64'

module Hex
  def self.encode(str)
    str.unpack('H*').first
  end

  def self.decode(str)
    [str].pack('H*')
  end
end

module Set1

  def self.hex_base64(str, flip = false)
    if flip
      Hex.encode Base64.decode64(str)
    else
      Base64.strict_encode64 Hex.decode(str)
    end
  end

  def self.fixed_xor(str1, str2)
    bytes1 = Hex.decode(str1).bytes
    bytes2 = Hex.decode(str2).bytes
    r = bytes1.zip(bytes2).map{|b1, b2| b1 ^ b2 }
    Hex.encode r.pack('C*')
  end

  def self.decrypt_single(str)
    bytes = Hex.decode(str).bytes
    lowercase = ('a'..'z').to_a
    uppercase = lowercase.map(&:upcase)
    alphabet = lowercase + uppercase
    strings = alphabet.map do |char|
      bytes.map{|b| b ^ char.bytes.first }.pack('C*')
    end
    scores = strings.map{|s| s.each_char.select{|c| (alphabet + [' ']).include?(c) }.count }
    max_score = scores.max
    score_pos = scores.index(max_score)
    strings[score_pos]
  end

end
