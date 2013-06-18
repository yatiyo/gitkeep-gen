require '../lib/gitkeep'

module Test
  class GitkeepTask
    attr_reader :gm

    def initialize
      @gm = Gitkeep::Manager.new 
    end

    def gitkeep_create
      puts '[create] .gitkeep files'
      gm.create
      puts ''
    end

    def gitkeep_remove
      puts '[remove] .gitkeep files'
      gm.remove
      puts ''
    end

    def gitignore_create
      puts '[create] .gitignore files'
      gm.create('.gitignore')
      puts ''
    end

    def gitignore_remove
      puts '[remove] .gitignore files'
      gm.remove('.gitignore')
      puts ''
    end

    def parent_path_create
      puts '[create] parent path'
      gm.create('.gitkeep', '../')
      puts ''
    end

    def parent_path_remove
      puts '[remove] parent path'
      gm.remove('.gitkeep', '../')
      puts ''
    end

    def ignore_files_create
      puts '[create] ignore files'
      gm.create('.gitkeep', '.', ['a', 'b'])
      puts ''
    end

    def ignore_files_remove
      puts '[remove] ignore files'
      gm.remove('.gitkeep', '.', ['a', 'b'])
      puts ''
    end
  end
end

####################################

test = Test::GitkeepTask.new
test.gitkeep_create
test.gitkeep_remove
test.gitignore_create
test.gitignore_remove
test.parent_path_create
test.parent_path_remove
test.ignore_files_create
test.ignore_files_remove
