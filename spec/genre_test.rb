require './genre'

describe Genre do
  context 'Instantiate the Genre object' do
    genre = Genre.new('comedy')

    describe '#new' do
      it 'Takes two parameters and returns agenre object' do
        expect(genre).to be_an_instance_of(Genre)
      end
    end

    it 'Test genre attributes?' do
      expect(genre.name).to eq 'comedy'
      expect(genre.items).to eq []
    end
  end
end
