require 'spec_helper'

describe 'Managing tags via names' do
  let(:venue) { Venue.create }

  it 'returns tag names' do
    venue.tags << create(:tag, :no_takeaway)

    expect(venue.tag_names.to_a).to eq ['no_takeaway']
  end

  it 'adds tags via their names' do
    venue.tag_names << 'no_takeaway'

    expect(venue.tags.map(&:tag)).to eq ['no_takeaway']
  end

  it 'accepts a completely new set of tags' do
    venue.tag_names = ['no_takeaway', 'not_serving']

    expect(venue.tags.map(&:tag)).to eq ['no_takeaway', 'not_serving']
  end

  it 'enumerates through tag names' do
    venue.tag_names = ['no_takeaway', 'not_serving']
    names = []

    venue.tag_names.each do |name|
      names << name
    end

    expect(names).to include('no_takeaway', 'not_serving')
  end

  xit 'does not allow duplication of tags' do
    existing = Venue.create
    existing.tags << create(:tag, :no_takeaway)

    venue.tag_names = ['no_takeaway']

    expect(existing.tag_ids).to eq venue.tag_ids
  end

  it 'appends tag names' do
    venue.tag_names  = ['no_takeaway']
    venue.tag_names += ['not_serving', 'other']

    expect(venue.tags.map(&:tag)).to eq ['no_takeaway', 'not_serving', 'other']
  end

  it 'removes a single tag name' do
    venue.tag_names = ['no_takeaway', 'not_serving']
    venue.tag_names.delete 'not_serving'

    expect(venue.tags.map(&:tag)).to eq ['no_takeaway']
  end

  it 'removes tag names' do
    venue.tag_names  = ['no_takeaway', 'not_serving', 'other']
    venue.tag_names -= ['not_serving', 'other']

    expect(venue.tags.map(&:tag)).to eq ['no_takeaway']
  end
end
