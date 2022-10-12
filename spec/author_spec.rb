require_relative '../author'
describe Author do
    let(:author) { Author.new("John", 'Doe') }
  
    describe '#new' do
      it 'creates a new Author' do
        expect(author).to be_an_instance_of(Author)
      end
  
      it 'has a first name' do
        expect(author.first_name).to eq("John")
      end
  
      it 'has a last namw' do
          expect(author.last_name).to eq("Doe")
      end
  
    end
  end