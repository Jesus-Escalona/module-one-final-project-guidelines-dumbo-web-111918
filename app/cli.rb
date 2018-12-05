
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
end

def register
    prompt = TTY::Prompt.new
    name = prompt.ask("Enter your name") do |q|
        q.required true
        q.modify   :capitalize
    end
    choices = %w(January February March April May June July August September October November December)
    month = prompt.select("Select your month of birth", choices)
    username = prompt.ask("Enter your username") do |q|
        q.required true
        q.modify   :lowercase
    end
    password = prompt.mask("Enter a new password") do |q|
        q.required true
    end

    user = User.create(name: name, username: username, password: password, month: month)
end

def leave
    puts "Goodbye!"

end
