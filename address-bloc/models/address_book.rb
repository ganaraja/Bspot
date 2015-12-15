require_relative 'entry'

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break;
      end
      index += 1
    end
    @entries.insert(index,Entry.new(name, phone_number, email))
  end

  def remove_entry(name)
    index = 0
    @entries.each do |entry|
      if name == entry.name
        @entries.delete_at(index)
        index += 1
      end
    end
  end

end