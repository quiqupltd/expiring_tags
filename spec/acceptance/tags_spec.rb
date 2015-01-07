require 'spec_helper'

describe 'Adding and removing tags' do
  let(:venue) { create(:venue) }
  let(:no_takeaway) { create(:tag, :no_takeaway) }
  let(:expired_tag) { create(:tag, :expired) }

  it 'stores new tags' do
    venue.tags << no_takeaway

    expect(venue.tags).to include(no_takeaway)
  end

  it 'removes existing tags' do
    venue.tags << no_takeaway

    venue.tags.delete no_takeaway

    expect(venue.tags).to be_empty
  end

  it 'hides expired tags' do
    venue.tags << expired_tag
    venue.tags << no_takeaway

    expect(venue.tags).to include(no_takeaway)
    expect(venue.tags.size).to eq(1)
    expect(venue.tag_names.count).to eq(1)
  end
end