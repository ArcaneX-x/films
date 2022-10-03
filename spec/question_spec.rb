# frozen_string_literal: true

require '../lib/question'
require '../lib/film'

RSpec.describe Question do
  let(:film) do
    Film.new('Мстители 4: Финал', 'Энтони Руссо', 2019)
  end
  let(:directors) { ['Энтони Руссо', 'Джеймс Кэмерон'] }

  describe '#correct_answer' do
    let(:question) { Question.new(film, directors) }

    it 'returns a film director like correct answer' do
      expect(question.correct_answer).to eq 'Энтони Руссо'
    end
  end

  describe '#answer_is_correct' do
    let(:question) { Question.new(film, directors) }
    it 'check if the correct answer is true' do
      expect(question.answer_is_correct?('Энтони Руссо')).to eq true
    end
  end

  describe '#options' do
    let(:question) { Question.new(film, directors) }
    it 'returns uniq list of directors plus correct director' do
      expect(question.options).to contain_exactly('Джеймс Кэмерон', 'Энтони Руссо')
    end
  end
end
