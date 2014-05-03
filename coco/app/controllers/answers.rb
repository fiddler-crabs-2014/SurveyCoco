post '/new_answer' do
  option_id = Option.where(content: params[:options])[0].id
  p params
  Answer.create!({option_id: option_id, question_id: params[:question_id], visitor_cookie: params[:visitor_cookie]})
  erb :thank_you
end
