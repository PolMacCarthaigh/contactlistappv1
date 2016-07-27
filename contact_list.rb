require_relative 'contact'

require "csv"
# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  class << self
    def list_out
      list = Contact.all
      x = 0
      while x < list.length 
        name = list[x][1]
        email = list[x][2]
        x = x + 1
        puts ("#{x}:  #{name},  #{email}")
      end
      puts ("---")
      puts ("#{x} records total")
    end
      # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
    def add_one
      puts ("What is the first and last name of the person you wish to add?")
      name = STDIN.gets.chomp
      puts ("What is #{name}'s email address?")
      email = STDIN.gets.chomp
      Contact.create(name, email)
    end

    def show_contact
      list = Contact.find(ARGV[1].to_i - 1)
      puts ("#{list[0]},  #{list[1]},  #{list[2]}")
    end
    def finder
      puts Contact.search(ARGV[1])
    end
  end
end



if ARGV.empty?
  puts "Here is a list of available commands:"
  puts "new - Create new contact"
  puts "list - List all contacts"
  puts "show - Show a contact"
  puts "search - Search for a contact"
else
  case ARGV[0]
  when "new"
    ContactList.add_one
  when "list"
    ContactList.list_out
  when "show"
    ContactList.show_contact
  when "search"
    ContactList.finder
  else
    p 'Please try again from the list provided!'
  end
end

