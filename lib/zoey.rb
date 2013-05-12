#!/usr/bin/env ruby
require 'yaml'
require 'net/smtp'

# Use yaml to support tagging feature
# zoey ls @work
# use Regex to parse the sentence, HOTNESS
class Item
  attr_accessor :tag, :text, :tid
  def initialize(value, options ={})
    @tag = value.scan(/@[A-Z0-9.-]+/i).last || '@next'
    @text = value.gsub(tag, '').strip
    @tid = options[:tid]
  end

  def to_s
    "#{@text}: #{@tag}"
  end
end

class Zoey
  # Thi is the daily mode, but it gets unpopular among users..
  # FILE_PATH = "#{File.dirname(__FILE__)}/logs/#{Time.now.strftime('%Y%m%d')}.txt"


  # Thi is the one-file mode
  FILE_PATH = "#{File.dirname(__FILE__)}/logs/zoey.txt"

  attr_accessor :items

  def initialize(options = {})
    @options, @items = options, []
    load_items
  end


  def load_items
    yaml_file = YAML.load_file(file)
    return @items unless yaml_file
    yaml_file.each do |key, texts|
      texts.each do |text|
        if key.to_s == @options[:filter] || @options[:filter].nil?
          @items << Item.new("#{text} #{key}") if key.to_s != '@done'
        end
      end
    end
    @items
  end

  def add!(item)
    @items << Item.new(item)
    save
    @items.last
  end

  def delete!(index)
    item = @items.delete_at(index.to_d - 1)
    save
    item
  end

  def clear!
    @items = []
    save
    @items
  end

  def check(index)
    item = @items[index.to_i - 1]
    item.tag = '@done'
    save
    item
  end

  def uncheck(index)
    item = @items[index.to_i - 1]
    item.tag = '@next'
    save
    item
  end

  def list
    # To guarantee a nice format
    spaces = @items.map(&:text).max_by(&:length) || 0
    @items.each_with_index do |item, index|
      printf "%s: %-#{spaces.size+5}s %s\n", index+1, item.text, item.tag
    end
  end

  def save
    File.open(FILE_PATH, "w") {|f| f.write(to_hash.to_yaml) }
  end

  def file
    unless File.exist?(FILE_PATH)
      File.new(FILE_PATH, 'w')
    end
    FILE_PATH
  end

  def to_hash
    @items.group_by(&:tag).inject({}) do |h,(k,v)|
      h[k.to_sym] = v.map(&:text); h
    end
  end

  def email(email)
   msg = <<MESSAGE_END
From: #{email}
To: #{email}
Subject: "Zoey: here's your today's todo list"

Hi,
Here is your todo list for today!

#{@items.each {|item| item.to_s}}
MESSAGE_END


    Net::SMTP.start('localhost') do |smtp|
        smtp.send_message msg, email, email
    end
  end

  if __FILE__ == $0
    case ARGV[0]
    when 'list','ls'
      Zoey.new(:filter => ARGV[1]).list
    when 'add','a'
      puts "Added: #{Zoey.new.add!(ARGV[1..-1].join(' '))}"
    when 'delete', 'del', 'd', 'rm'
      puts "Deleted: #{Zoey.new.delete!(ARGV[1])}"
    when 'check', 'done'
      puts "Check: #{Zoey.new.check(ARGV[1])}"
    when 'email'
      puts "Email: #{Zoey.new.email(ARGV[1])}"
    when 'clear'
      puts "All #{Zoey.new.clear!} todos cleared!"
    when 'help'
      puts "\nUsage: todo [options] COMMAND\n\n"
      puts "Commands:"
      puts "  add TODO        Adds a todo"
      puts "  delete NUM      Removes a todo"
      puts "  done NUM        Completes a todo"
      puts "  list [CONTEXT]  Lists all active todos"
      puts "  email [EMAIL]   Email todo list"
    else
      puts "Hmm, I do not know how to perform this task.."
    end
  end
end
