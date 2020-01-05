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
    @word = Word.find(params[:id].to_i)
    erb(:word)
end

post ('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:word_def], [:actual_word])
  definition.update(params[:word_def], @word.id)
  erb(:word)
end

get ('/words/:id/definitions/:def_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:def_id].to_i())
  erb(:definition)
end

patch ('/words/:id/definitions/:def_id' ) do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:def_id].to_i)
  definition.update(params[:word_def], @word.id)
  erb(:definition)
end

delete('/words/:id/definitions/:def_id') do
  definition = Definition.find(params[:def_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
