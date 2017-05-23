require_relative 'entry'
require 'csv'

class AddressBook
    attr_reader :entries

    def initialize
        @entries = []
    end

    def add_entry(name, phone_number, email)
        index = 0
        entries.each do |entry|
            if name < entry.name
                break
            end
            index += 1
        end

        entries.insert(index, Entry.new(name, phone_number, email))
    end

    def remove_entry(name, phone_number, email)
        entries.delete_if { |entry| entry.name == name && entry.phone_number == phone_number && entry.email == email }
    end

    def import_from_csv(file_name)
        csv_text = File.read(file_name)
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
        csv.each do |row|
            row_hash = row.to_hash
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end

    def binary_search(name)
        # leftmost element is named lower
        # rightmost element is upper
        lower = 0
        upper = entries.length - 1

        # loop while lower index is <= upper
        while lower <= upper
            # find the mid and save it to a variable
            mid = (lower + upper) / 2
            mid_name = entries[mid].name

            # compare names to name of middle index
            # if name is equal to the middle, then we found our name
            if name == mid_name
                return entries[mid]

            # if name is before mid_name then name is in the lower half
            elsif name < mid_name
                upper = mid - 1
                # if name is after mid_name then name is in the upper half
            elsif name > mid_name
                lower = mid + 1
            end
        end
        # if we go through everything without a match, it returns nil
        return nil
    end
end

a = AddressBook.new
a.import_from_csv('entries.csv')
