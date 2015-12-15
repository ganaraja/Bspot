require_relative '../models/entry'

RSpec.describe Entry do

 context "attributes" do
   it "should respond to name" do
     entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
     expect(entry).to respond_to(:name)
   end

   it "should respond to phone number" do
     entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
     expect(entry).to respond_to(:phone_number)
   end

   it "should have email" do
     entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
     expect(entry).to respond_to(:email)
   end
 end
end
