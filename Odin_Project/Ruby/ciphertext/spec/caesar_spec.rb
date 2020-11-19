require 'caesar'

describe "caesar" do
  it "should return a ciphered text" do
    expect(cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
  end

  it "should return a ciphered text" do
    expect(cipher("Hello, World!", 5)).to eq("Mjqqt, Btwqi!")
  end
end
