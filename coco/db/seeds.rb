require 'faker'

# create a few users
10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
end
# TODO: create associations between users and surveys

20.times do
  Survey.create(survey_name: Faker::Company.name, user_id: ((1..10).to_a.sample))
end


questions = ["whats your favorite color?", "whats your favorite movie?", "Which City SUCKS the least?"]

Survey.all.each do |survey|
  2.times do
    survey.questions << Question.create(content: questions.sample, survey_id: survey.id)
  end
end

options_1 = ["blue", "purple haze", "orange kush"]
options_2 = ["the croods", "polar express", "titanic"]
options_3 = ["Tampa", "Atlanta", "Canada"]
Question.all.each do |question|
  if question.content == "whats your favorite color?"
    Option.create(content: options_1[0], question_id: question.id)
    Option.create(content: options_1[1], question_id: question.id)
    Option.create(content: options_1[2], question_id: question.id)
  elsif question.content == "whats your favorite movie?"
    Option.create(content: options_2[0], question_id: question.id)
    Option.create(content: options_2[1], question_id: question.id)
    Option.create(content: options_2[2], question_id: question.id)
  else
    Option.create(content: options_3[0], question_id: question.id)
    Option.create(content: options_3[1], question_id: question.id)
    Option.create(content: options_3[2], question_id: question.id)
  end
end

Option.all.each do |option|
  visitor_cookie = (100..999).to_a.sample
  if options_1.to_s.match(option.content)
    Answer.create(content: options_1.sample, option_id: option.question_id, visitor_cookie: visitor_cookie)
  elsif options_2.to_s.match(option.content)
    Answer.create(content: options_2.sample, option_id: option.question_id, visitor_cookie: visitor_cookie)
  else
    Answer.create(content: options_3.sample, option_id: option.question_id, visitor_cookie: visitor_cookie)
  end
end



