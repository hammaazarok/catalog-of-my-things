require './items'
require './book'
require './label'

describe Items do
  it 'Test Items attributes' do
    item = Items.new('2014-02-22')

    expect(item.publish_date).to eq 2014
    expect(item.genre).to eq nil
    expect(item.move_to_archive).to eq false
  end
end

describe Book do
  it 'Test Book attributes and method' do
    book = Book.new('Scribe', 'bad', '2014-02-22', false)

    expect(book.publisher).to eq 'Scribe'
    expect(book.cover_state).to eq 'bad'
    expect(book.move_to_archive).to eq true
  end
end

describe Label do
  before(:each) do
    @book = Book.new('Scribe', 'bad', '2014-02-22', false)
  end

  it 'Test Label attributes' do
    label = Label.new('Love', 'red')

    expect(label.title).to eq 'Love'
    expect(label.color).to eq 'red'
    expect(label.items).to eq []
    expect(label.add_items(@book)).to eq [label.items[0]]
  end
end
