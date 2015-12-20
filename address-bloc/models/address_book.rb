require_relative 'entry'
require 'csv'

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

  def import_from_csv(file_name)
    csv_text = File.read(file_name)

    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end

  def binary_search(name)
    low = 0
    high = @entries.length - 1

    while (low <= high) do
      mid = (low + high) / 2
      mid_name = entries[mid].name

      if(name == mid_name)
        return @entries[mid]
      elsif name < mid_name
        high = mid - 1
      elsif name > mid_name
        low = mid + 1
      end
    end
    return nil
  end

  def iterative_search(name)
    index = 0
    @entries.each do |entry|
      if name == entry.name
        return @entries[index]
      end
      index += 1
    end
    return nil
  end

end
