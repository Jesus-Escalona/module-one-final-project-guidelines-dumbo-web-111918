def welcome
    prompt = TTY::Prompt.new
    type(["Hello Dreamer, ","what would you like to do today?☺️"])
    menu
end

def menu
  prompt = TTY::Prompt.new
  puts "👾👻👾👻👾👻👾👻👾👻👾👻👾👻"
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

def logged_menu(user)
    prompt = TTY::Prompt.new
    choices = ["Show Past Dreams", "New Dream", "Logout"]
    choice = prompt.select("Select an option", choices)
    case choice
        when "Show Past Dreams"
            show_dreams(user)
        when "New Dream"
            enter_dream(user)
        else
            menu
    end
end

def login
  prompt = TTY::Prompt.new
  username = prompt.ask(anim("Enter your username")) do |q|
      q.required true
  end
  password = prompt.mask(anim("Enter your password")) do |q|
      q.required true
  end
  this_user = User.find_by(username: username)
  if this_user
    if this_user.password == password
        logged_menu(this_user)
    else
      puts "The password is incorrect"
      menu
    end
  else
    puts "the user is invalid, try again"
    menu
  end
end

def register
  prompt = TTY::Prompt.new
  username = prompt.ask(anim("Enter your username")) do |q|
    q.required true
  end
  name = prompt.ask(anim("Enter your first name")) do |q|
      q.required true
      q.modify   :capitalize
    end
  password = prompt.mask(anim("Enter a new password")) do |q|
      q.required true
    end
  user = User.create(name: name, username: username, password: password)
  anim("You're all signed up! now please log in")
  menu
end

def leave
    return "Goodbye!"
end

def show_dreams(user)
    prompt = TTY::Prompt.new
    a = Artii::Base.new :font => 'doom'
    puts a.asciify("Dream history")
    dreams = user.dreams.each_with_index.map { |dream, i| "#{i+1}. #{dream.content}. Created on #{dream.created_at.strftime('%B, %d, %Y')}" }
    if dreams.empty?
        anim("Can't find any dreams here.. maybe enter a new one")
    end
    dreams << "New dream"
    dreams << "Go back"
    choice = prompt.select("Select an option", dreams)
    case choice
        when "New dream"
            enter_dream(user)
        when "Go back"
            logged_menu(user)
        else
            instance = user.dreams.find_by(content: choice)
            #Shows the complete analysis of the dream calling the method
            #dream.analysis
            instance.analyze
            # binding.pry
            logged_menu(user)
    end
end

def enter_dream(user)
  prompt = TTY::Prompt.new
  dream_content = prompt.ask(anim("Tell me, what did you dream about last night?")) do |q|
      q.required true
    end
  dream = Dream.create(content: dream_content)
  user.dreams << dream
  get_data(user, dream)
end
