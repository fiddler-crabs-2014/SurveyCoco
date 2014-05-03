get '/new_survey' do
  erb :new_survey
end

post '/create_survey' do
  @survey = Survey.create(survey_name: params[:name])
  redirect '/survey/' + @survey.id
end

get '/survey/:survey_id' do
  @options = []
  @survey = Survey.find(params[:survey_id])
  @questions = Question.where(survey_id: params[:survey_id])

  if @survey.user_id == session[:user_id]
    @answers = Answer.where(survey_id: @survey_id)
  end

  @questions.each do |question|
    @options << Option.where(question_id: question.id)
  end

  @options.each do |option_array|
    option_array.each do |option|
      Answer.where(content: option)
    end
  end

  erb :survey
end

post '/new_question' do
  @content = params[:content]
  @options = params[:options].split(',')
  @survey_id = params[:survey_id]
  @question = Question.create({content: @content, options: @options, survey_id: @survey_id})
  return {question_id: @question.id, content: @content, options: @options}.to_json
end

# @questions = ['who?','what?','where?','why?']
# @options = [['me','myself','i'],['this','that','no idea'],['there','over there','thar','that way'],['chicken butt','because','i said so','that\'s the way it goes']]
