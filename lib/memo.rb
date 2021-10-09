class Memo < Post
  def read_from_console
    @text = []
    line = nil

    puts "Новая заметка (вводите любой текст до строки \"end\"):"

    while line != "end"
      line = STDIN.gets.chomp
      @text << line
    end

    @text.pop
  end

  def content
    time_string = "Создано #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")}\n"

    [time_string, @text].join("\n")
  end
end
