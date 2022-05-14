require_relative '../music_album'
require_relative '../../data/data_crud'

module AppBook
  include Datas

  def inp(array)
    array_inputs = []
    array.each do |i|
      print "#{i}: "
      array_inputs.push(gets.chomp)
    end
    array_inputs
  end

  def list_all_music_albums
    music_albums = render_data('music_album')
    puts('There is no music album yet') if music_albums.empty?
    music_albums.each_with_index do |music, index|
      puts(
        "#{index + 1}) Name: #{music['name']}, Album: #{music['album']},
        Audio/Video: #{music['audio/video']}, release-date: #{music['release-date']}"
      )
    end
  end

  def add_music_albums
    music_albums = fetch_data('music_album')
    input = inp(%w[Name Publisher Cover-State Publish-Date])
    book = Book.new(input[0], input[1], input[2], input[2])
    book_obj = {
      name: book.name,
      publisher: book.publisher,
      cover_state: book.cover_state,
      publish_date: book.publish_date
    }
    music_albums.push(book_obj)
    update_data('books', music_albums)
    puts('Book created Successfully')
  end
end
