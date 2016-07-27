require 'csv'

# Represents a person in an address book.
class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self
    
    # Returns an Array of Contacts loaded from the database.
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      list = Array.new
      CSV.foreach('contacts.csv') do |row1|
        list << row1
      end
      return list
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      id_number = Contact.all
      id_number = id_number.length+1
      CSV.open("contacts.csv", "a") do |csv|
        csv << [id_number, name, email]
      end
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      id_number = ARGV[1].to_i
      list = Contact.all
      return list[id_number]
    end

    # Returns an array of contacts who match the given term.
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
      
      #csv_text = File.read('contacts.csv')
      #p csv_text
      #csv = CSV.parse(csv_text, :headers => true)
      #p csv
      #return csv.find {|row| row['Name'] == @term}
    end
   end
 end
end
  
