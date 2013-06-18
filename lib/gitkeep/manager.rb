module Gitkeep
  class Manager
    attr_reader :gc, :gr

    EMPTY_FILE_NAME = '.gitkeep'
    SEARCH_PATH     = '.'
    IGNORE_FILES    = ['.git']

    def initialize
      @gc = Gitkeep::Create.new
      @gr = Gitkeep::Remove.new
    end

    def create(file_name = EMPTY_FILE_NAME, path = SEARCH_PATH,
               ignore_files = IGNORE_FILES)
      dir_list = gc.empty_dir_list(path, ignore_files)
      dir_list.each { |dir| puts dir }
      
      if empty?(dir_list)
        puts 'nothing empty directory'
      else
        puts 'create files?[y/n]'
        if input_yes?(STDIN.gets.chomp)
          gc.create_empty_file(dir_list, file_name)
          puts 'complite!'
        end
      end
    end

    def remove(file_name = EMPTY_FILE_NAME, path = SEARCH_PATH,
               ignore_files = IGNORE_FILES)
      path_list = gr.gitkeep_list(file_name, path, ignore_files)
      path_list.each { |path| puts path }

      if empty?(path_list)
        puts "nothing #{file_name} files"
      else
        puts 'remove files?[y/n]'
        if input_yes?(STDIN.gets.chomp)
          gr.remove_gitkeep_file(path_list)
          puts 'complite!'
        end
      end
    end

    def input_yes?(input)
      input = '' if input.nil?
      true if /^y(es)?$/i =~ input
    end

    def empty?(list)
      list.instance_of?(Array) ? list.empty? : list.nil?
    end
  end
end
