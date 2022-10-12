require_relative '../game'

describe Game do
  let(:game) { Game.new(true, '2020-06-01', '2010-06-01', false) }

  describe '#new' do
    it 'creates a new game' do
      expect(game).to be_an_instance_of(Game)
    end

    it 'has a multi player' do
      expect(game.mulipalyer).to eq(true)
    end

    it 'has an publish date' do
      expect(game.publish_date.to_date.to_s).to eq('2010-06-01')
    end

    it 'can be archived' do
      expect(game.move_to_archive).to eq(false)
    end
  end
end
