require 'rails_helper'

RSpec.describe StssTrade, type: :model do
  it "has none to begin with" do
    expect(StssTrade.count).to eq 0
  end
end
