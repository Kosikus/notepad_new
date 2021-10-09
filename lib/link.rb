class Link < Post
  def initialize
    super

    @url = nil
  end

  def read_from_console
    puts "Адрес ссылки:"
    @url = STDIN.gets.chomp

    puts "Описание ссылки:"
    @text = STDIN.gets.chomp
  end

  def content
    time_string = "Создано #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")}\n"

    [time_string, @url, @text].join("\n")
  end
end
