# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TodoEntriesHelper. For example:
#
# describe TodoEntriesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TodoEntriesHelper, type: :helper do
  context 'priority_to_string' do
    describe 'should correctly map priority integers to corresponding string' do
      it 'should map priorities correctly' do
        expect(priority_to_string(3)).to eq('High')
        expect(priority_to_string(2)).to eq('Medium')
        expect(priority_to_string(1)).to eq('Low')
        expect(priority_to_string(nil)).to eq('None')
      end

      it 'should handle illegal priorities correctly' do
        expect { priority_to_string(0) }.to raise_error(ArgumentError)
        expect { priority_to_string(4) }.to raise_error(ArgumentError)
      end
    end
  end
end
