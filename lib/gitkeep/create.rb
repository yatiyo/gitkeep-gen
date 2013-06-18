module Gitkeep
  class Create
    def empty_dir_list(path, ignore_files = [])
      # TODO solaris support
      list = `find #{path} -type d -empty`
      list.split("\n").map { |e|
        e unless ignore_file?(e, ignore_files)
      }.compact
    end

    def create_empty_file(dir_list, file_name)
      dir_list = [dir_list] if dir_list.instance_of?(String)
      if dir_list.instance_of?(Array)
        dir_list.each { |dir| `touch #{dir}/#{file_name}` }
      end
    end

    def ignore_file?(path, ignore_files)
      path.split('/').map { |name|
        ignore_files.map { |e| name == e }.include?(true)
      }.include?(true)
    end
  end
end
