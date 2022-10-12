require './music'

describe MusicAlbum do
  context 'Instantiate the Music object' do
    music = MusicAlbum.new('false', '2020-10-24', false)

    describe '#new' do
      it 'Takes three parameters and returns a Music album object' do
        expect(music).to be_an_instance_of(MusicAlbum)
      end
    end

    it 'can be moved to archive?' do
      expect(music.move_to_archive).to eq true
    end
  end
end
