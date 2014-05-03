post '/new_answer' do
  visitor_cookie = params[:visitor_cookie]
  params.each do |key, value|
    if key != 'visitor_cookie'
      temp_option = Option.find(value).id
      p temp_option
      Answer.create!({option_id: temp_option, question_id: key, visitor_cookie: visitor_cookie})
    end
  end

  erb :thank_you
end

