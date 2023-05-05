require 'rspec'
require_relative '../classes/book'

describe Book do
  let(:publisher) { 'Penguin' }
  let(:cover_state) { 'bad' }
  let(:publish_date) { Date.today - 12.year }
  let(:book) { Book.new('Book Name', publisher, publish_date, cover_state) }

  describe '#initialize' do
    it 'sets publisher and cover_state' do
      expect(book.publisher).to eq('Penguin')
      expect(book.cover_state).to eq('bad')
    end
  end

  describe '#can_be_archived?' do
    context 'when cover state is bad' do
      it 'returns true' do
        expect(book.can_be_archived?).to be_truthy
      end
    end
  end
end
