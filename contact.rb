require 'csv'

class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end
  
  class << self
    
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      list = Array.new
      CSV.foreach('contacts.csv') do |row1|
        list << row1
      end
      return list
    end

    def create(name, email)
      id_number = Contact.all
      id_number = id_number.length+1
      CSV.open("contacts.csv", "a") do |csv|
        csv << [id_number, name, email]
      end
    end

    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      id_number = ARGV[1].to_i
      list = Contact.all
      return list[id_number]
    end

   
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      @term = term
      list = Contact.all
      x = 0
      while x < list.length 
        name = list[x][1]
        email = list[x][2]
        x = x + 1
        puts ("#{x}:  #{name},  #{email}")
      
    end
   end
 end
end
  
