require 'fileutils'

def check_if_user_gave_input
  abort("mkdiruby : missing folder name. Use as command '$ mkdiruby my_ruby_foler_name'") if ARGV.empty?
end

def get_directory_name
  return ARGV.join("_")
end

def create_directory(name)

  # creates lib and spec
  FileUtils.mkdir_p("#{name}/lib")
  FileUtils.mkdir_p("#{name}/spec")
  
  # lib directory
  Dir.chdir("#{name}/lib") do
    # ruby file. add all the necessary required
    File.open("#{name}.rb", "w") do |f|
       f.write("require 'rubygems'\nrequire 'nokogiri'\nrequire 'open-uri'\nrequire 'pry'\nrequire 'rubocop'\nrequire 'dotenv'\nrequire 'watir'\nrequire 'selenium-webdriver'\nrequire 'launchy'")
    end
  end

  # spec directory
  Dir.chdir("#{name}/spec") do
    File.open("#{name}_spec.rb", "w") do |f|
      f.write("require_relative '../lib/#{name}'")
    end
  end

  # name directory
  Dir.chdir("#{name}") do
    # README.md
    File.open("README.md", "w") {|f| f.write("#{name} - Ruby programm") }
    
    # Gemfile
    File.open("Gemfile", "w") do |f|
      f.write("source 'https://rubygems.org'\nruby '2.7.4'\ngem 'rspec'\ngem 'pry'\ngem 'rubocop'\ngem 'dotenv'\ngem 'watir'\ngem 'selenium-webdriver'\ngem 'launchy'")
    end

    # .gitignore
    File.open(".gitignore", "w") {|f| f.write(".env")}

    # .env
    File.open(".env", "w") {|f| f.write("put secrets here")}
  end
end

def system_init(name)
  Dir.chdir("#{name}") do
    system("rspec --init")
    system("bundle install")
    system("git init")
  end
end

def perform
  check_if_user_gave_input
  name = get_directory_name
  create_directory(name)
  system_init(name)
end

perform