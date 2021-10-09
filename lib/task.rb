class Task < Post
  def initialize
    super

    @due_date = nil
  end

  def read_from_console
    puts "Что нужно сделать?"
    @text = STDIN.gets.chomp


    puts "К какой дате нужно выполнить. Укажите дату в формате ДД.ММ.ГГГГ, например \"02.05.1998\""
    input = STDIN.gets.chomp

    @due_date = Date.strptime(input, "%d.%m.%Y")
  end

  def content
    time_string = "Создано #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")}\n"
    deadline_string = "Крайний срок: #{@due_date}"

    [time_string, @text, deadline_string].join("\n")
  end
end
