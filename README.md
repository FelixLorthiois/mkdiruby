creates a complete directory for a new Ruby project with the following command : 
`$ ruby mkdiruby name_of_your_project`
THe directory includes
- README.md
- .env
- .gitignore
- Gemfile containing a set of popular gems
- a 'lib' sub-directory containing 'name_of_your_project.rb', with all the necessary 'require XXX' already written in
- a 'spec' sub-directory containing 'name_of_your_project_spec.rb', with the necessary 'require_relative'
- .rspec created by '$ rspec --init' command
- .git created by '$ git init' command
- all gems installed by '$ bundle install' 

