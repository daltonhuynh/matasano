require_relative '../src/set1'

describe Set1 do

  context "Problem #1" do
    let(:hex) { '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d' }
    let(:base64) { 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t' }

    it "converts a hex string to base64" do
      Set1.hex_base64(hex).should == base64
    end

    it "converts a base64 string to hex" do
      Set1.hex_base64(base64, true).should == hex
    end
  end

  context "Problem #2" do
    let(:hex1) { '1c0111001f010100061a024b53535009181c' }
    let(:hex2) { '686974207468652062756c6c277320657965' }
    let(:result) { '746865206b696420646f6e277420706c6179' }

    it "creates the result" do
      Set1.fixed_xor(hex1, hex2).should == result
    end
  end

  context "Problem #3" do
    let(:encoded_string) { '1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736' }

    it "decrypts the string" do
      Set1.decrypt_single(encoded_string).should == "Cooking MC's like a pound of bacon"
    end
  end

  context "Problem #4" do
    it "decrypts the string" do
      strings = File.open('./spec/support/problem_4.txt').map do |line|
        Set1.decrypt_single(line.strip)
      end
      Score.best(strings).should == "Now that the party is jumping\n"
    end
  end

end