require 'spec_helper'

describe 'Adding and removing tags' do
  let(:venue) { create(:venue) }
  let(:no_takeaway) { create(:tag, :no_takeaway) }

  it 'stores new tags' do
    venue.tags << no_takeaway

    expect(venue.tags).to include(no_takeaway)
  end

  it 'removes existing tags' do
    venue.tags << no_takeaway

    venue.tags.delete no_takeaway

    expect(venue.tags).to be_empty
  end
end