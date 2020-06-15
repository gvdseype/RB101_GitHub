def is_integer?(input)
  input.to_i.to_s == input
end

def minilang(commands)
commands = commands.split
commands.map! {|el| is_integer?(el) ? el.to_i : el}
stack = []
total = 0
register = 0
  commands.each do |el|
    if is_integer?(el.to_s)
      register = 0
      register += el
    elsif el == "PUSH"
      stack << register
    elsif el == "ADD"
      register += stack.pop 
    elsif el == "SUB"
      register -= stack.pop
    elsif el == "MULT"
      register *= stack.pop
    elsif el == "POP"
      register = 0
      register = stack.pop
    elsif el == "DIV"
      register /= stack.pop
    elsif el == "MOD"
      array = (register).divmod(stack.pop)
      register = array[1]
    elsif el == "PRINT"
      p register
    end
  end
end

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')