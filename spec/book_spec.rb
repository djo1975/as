# require 'rspec'
# require_relative '../classes/book'

# describe Book do
#   let(:publisher) { 'Penguin' }
#   let(:cover_state) { 'Good' }
#   let(:publish_date) { Date.today - 1.year }
#   let(:book) { Book.new('Book Name', publisher, cover_state, publish_date) }

#   describe '#initialize' do
#     it 'sets publisher and cover_state' do
#       expect(book.publisher).to eq(publisher)
#       expect(book.cover_state).to eq(cover_state)
#     end
#   end

#   describe '#can_be_archived?' do
#     context 'when cover state is not bad' do
#       it 'returns true' do
#         expect(book.can_be_archived?).to be_truthy
#       end
#     end

#     context 'when cover state is bad' do
#       let(:cover_state) { 'Bad' }
#       it 'returns true if publish date is more than 5 years ago' do
#         expect(book.can_be_archived?).to be_truthy
#       end

#       it 'returns false if publish date is less than or equal to 5 years ago' do
#         book.publish_date = Date.today - 5.years
#         expect(book.can_be_archived?).to be_falsey
#       end
#     end
#   end
# end
