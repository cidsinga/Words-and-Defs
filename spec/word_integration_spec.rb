require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word', :with => 'Snarfblat')
    click_on('Go!')
    expect(page).to have_content('Snarfblat')
  end
end

describe('create a song path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    word = Word.new("Snarfblat")
    word.save
    visit("/words/#{word.id}")
    fill_in('word_def', :with => 'A fork')
    click_on('Add definition')
    expect(page).to have_content('A fork')
  end
end
