require 'sinatra'

students = {
  # 0 => {
  #   name: "dude",
  #   age: 10,
  #   spell: "No clue"
  # }
}

counter = 0

#display the list of students
get '/students' do

  erb :index, locals: { students: students }

end

#register a student
post '/register' do

  newbie = {
    name: params[:name],
    age: params[:age],
    spell: params[:spell],
    id: counter
  }

  students[counter] = newbie
  counter += 1
  redirect '/students'

end

get '/students/:id' do

  selected_student = students[params[:id].to_i]
  erb :show, locals: { selected_student: selected_student }

end

put '/students/:id' do

  student = students[params[:id].to_i]
  student[:name] = params[:newname]
  student[:age] = params[:newage]
  student[:spell] = params[:newspell]

  redirect '/students'

end

delete '/students/:id' do

  students.delete(params[:id].to_i)
  redirect '/students'

end
