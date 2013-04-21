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

end
