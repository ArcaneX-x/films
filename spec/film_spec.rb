# frozen_string_literal: true

require '../lib/film'

RSpec.describe '::new' do
  let(:films) { Film.read_from_dir(Dir[File.join(__dir__, 'fixtures', '*.txt')]) }

  it 'returns array of objects' do
    expect(films).to be_an Array
    expect(films).to all be_an Film
    expect(films.size).to eq 2
  end

  it 'returns correct data' do
    titles = films.map(&:title)
    directors = films.map(&:director)
    years = films.map(&:year)

    expect(titles).to contain_exactly('Мстители 4: Финал', 'Аватар')
    expect(directors).to contain_exactly('Энтони Руссо', 'Джеймс Кэмерон')
    expect(years).to match_array [2019, 2009]
  end
end
