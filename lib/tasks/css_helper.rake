namespace :css_helper do
  desc "TODO"

  file = "app/views/layouts/application.html.erb"

  task add_class: :environment do
    File.readlines(file).each do |line|
      if line.include?("class")
        puts line
        p line.scan(/(?<=(class(:"|="))).[^"]*(?<!" )/)
        puts "---------------"
      end
    end
  end
end
