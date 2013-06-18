module Gitkeep
  class Remove
    def gitkeep_list(file_name, path, ignore_files)
      # TODO solaris support
      list = `find #{path} -name "#{file_name}"`
      list.split("\n").map { |e|
        e unless ignore_file?(e, ignore_files)
      }.compact
    end

    def remove_gitkeep_file(path_list)
      path_list = [path_list] if path_list.instance_of?(String)
      if path_list.instance_of?(Array)
        path_list.each { |file| `rm -rf #{file}` }
      end
    end

    def ignore_file?(path, ignore_files)
      path.split('/').map { |name|
        ignore_files.map { |e| name == e }.include?(true)
      }.include?(true)
    end
  end
end
