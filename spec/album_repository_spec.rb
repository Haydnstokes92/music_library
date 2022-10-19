require 'album_repository'

RSpec.describe AlbumRepository do
  def reset_album_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_album_table
  end


  it 'returns two albums' do
    repo = AlbumRepository.new
    albums = repo.all

    expect(albums.length).to eq(2) # => 2

    expect(albums.first.title).to eq('Flip Flop') # => 'Flip Flop'
    expect(albums.first.release_year).to eq('2022') # => '2022'
    expect(albums.first.artist_id).to eq ('1') # => '1'
  end
end