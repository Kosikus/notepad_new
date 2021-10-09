class Post
  def self.post_types
    [Memo, Link, Task]
  end

  def self.create_post(post_type)
    post_types[post_type].new
  end

  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console
    # @text = STDIN.gets.chomp
    # TODO
  end

  def content
    # TODO
  end

  def save
    file_name = @created_at.strftime("#{self.class}_%Y_%m_%d_%H_%M_%S.txt")

    puts content
    puts content.encoding

    File.write(File.join(__dir__, file_name), content, encoding: "UTF-8")
  end

  def file_path
    file_name = @created_at.strftime("#{self.class}_%Y_%m_%d_%H_%M_%S.txt")
  end
end
