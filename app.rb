require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/definition')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

post('/words') do
  @word = Word.new(*params.values).save
  @words = Word.all
    erb(:words)
end
get('/words/new') { erb(:words_new) }

get('/words/:id') do
    @word = Word.find(params[:id])
    erb(:word)
end
