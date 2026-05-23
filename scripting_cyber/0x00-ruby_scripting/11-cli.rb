#!/usr/bin/env ruby
require 'optparse'

file_path = 'tasks.txt'

OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on("-a", "--add TASK", "Add a new task") do |task|
    File.open(file_path, "a") do |f|
      f.puts(task)
    end
    puts "Task '#{task}' added."
  end

  opts.on("-l", "--list", "List all tasks") do
    if File.exist?(file_path)
      File.readlines(file_path).each_with_index do |line, index|
        puts "#{index + 1}. #{line.chomp}"
      end
    end
  end

  opts.on("-r", "--remove INDEX", Integer, "Remove a task by index") do |index|
    if File.exist?(file_path)
      tasks = File.readlines(file_path)
      if index > 0 && index <= tasks.length
        removed_task = tasks.delete_at(index - 1)
        File.write(file_path, tasks.join)
        puts "Task '#{removed_task.chomp}' removed."
      end
    end
  end

  opts.on("-h", "--help", "Show help") do
    puts opts
    exit
  end
end.parse!
