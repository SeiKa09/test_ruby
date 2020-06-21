require 'rails_helper'

RSpec.describe Account, type: :model do

  it { should belong_to(:user) }
  it { should have_many(:transactions) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:bank) }
  it { should validate_inclusion_of(:bank).in_array(['VCB', 'VIB', 'ACB']) }
end