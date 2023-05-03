require 'rspec'
require_relative '../classes/book'

describe Book do
  let(:cover_state) { 'Book Title' }
  let(:publisher) { 'Penguin' }
  let(:book) { Book.new(publisher, cover_state) }
  describe '#initialize' do
    it 'sets publisher and cover_state' do
      expect(book.publisher).to eq('Penguin')
      expect(book.cover_state).to eq('Book Title')
    end
  end
  describe '#can_be_archived?' do
    context 'when cover state is not bad' do
      it 'returns true' do
        expect(book.can_be_archived?).to be_truthy
      end
    end
    context 'when cover state is bad' do
      let(:book) { Book.new(publisher, 'bad') }
      it 'returns true' do
        expect(book.can_be_archived?).to be_truthy
      end
    end
  end
end
