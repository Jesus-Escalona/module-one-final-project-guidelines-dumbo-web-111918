def welcome
  prompt = TTY::Prompt.new
  puts "Hello Dreamer, what would you like to do today?"
  choices = %w(Login Register Leave)
  choice = prompt.select("Select an option", choices)
  case choice
    when "Login"
      login
    when "Register"
      register
    else
      leave
  end
end

def login
  prompt = TTY::Prompt.new
  username = prompt.ask("Enter your username") do |q|
      q.required true
      q.modify   :lowercase
  end
  password = prompt.mask("Enter your password") do |q|
      q.required true
  end
  this_user = User.find_by(username: username)
  if this_user
    if this_user.password == password
      enter_dream(this_user)
    else
      puts "The password is incorrect"
    end
  else puts "the user is invalid"
  end
end

def register
  prompt = TTY::Prompt.new
  username = prompt.ask("Enter your username") do |q|
    q.required true
  end
  name = prompt.ask("Enter your first name") do |q|
      q.required true
      q.modify   :capitalize
      q.validate /\A\w+\Z/
    end
  password = prompt.mask("Enter a new password") do |q|
      q.required true
    end
  user = User.create(name: name, username: username, password: password)
  puts "You're all signed up! Let's get started!"
  enter_dream(user)
end

def leave
    return "Goodbye!"
end

def enter_dream(user)
  prompt = TTY::Prompt.new
  dream_content = prompt.ask("Hello, #{user.name}, tell me, what did you dream about last night?") do |q|
      q.required true
    end
  dream = Dream.create(content: dream_content)
  user.dreams << dream
  get_data(dream_content)
end

