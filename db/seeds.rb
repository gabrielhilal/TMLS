# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Customer.delete_all
Customer.create(name: 'Customer 1', address1: '32 North end Road', address2: 'West Kensington', city: 'London',
                postcode: 'W14 0SH', country: 'UK', contact: 'John', email: 'customer1@gmail.com', telephone: '02098736734',
                discount: '1', terms: 'Until 2% we are not involved with single return. Insurance must be covered by buyers.
                All goods have been inspected and it is in accordance with the customers request.
                Please do not accept if seal is broken.')
Customer.create(name: 'Customer 2', address1: '32 North end Road', address2: 'West Kensington', city: 'London',
                postcode: 'W14 0SH', country: 'UK', contact: 'John', email: 'customer2@gmail.com', telephone: '02098736734',
                discount: '1', terms: 'Until 2% we are not involved with single return. Insurance must be covered by buyers.
                All goods have been inspected and it is in accordance with the customers request.
                Please do not accept if seal is broken.')
# . . .
Consignee.delete_all
Consignee.create(name: 'Consignee 1', address1: '32 North end Road', address2: 'West Kensington', city: 'London',
                 postcode: 'W14 0SH', country: 'UK', customer_id: '1')
Consignee.create(name: 'Consignee 2', address1: '32 North end Road', address2: 'West Kensington', city: 'London',
                 postcode: 'W14 0SH', country: 'UK', customer_id: '2')
Consignee.create(name: 'Consignee 3', address1: '32 North end Road', address2: 'West Kensington', city: 'London',
                 postcode: 'W14 0SH', country: 'UK', customer_id: '1')
Consignee.create(name: 'Consignee 4', address1: '32 North end Road', address2: 'West Kensington', city: 'London',
                 postcode: 'W14 0SH', country: 'UK', customer_id: '2')
# . . .
Factory.delete_all
Factory.create(name: 'Factory 1', address1: '32 North end Road', address2: 'West Kensington', city: 'London',
               postcode: 'W14 0SH', country: 'UK', contact: 'John', email: 'factory1@gmail.com', telephone: '1237266343')
Factory.create(name: 'Factory 2', address1: '32 North end Road', address2: 'West Kensington', city: 'London',
               postcode: 'W14 0SH', country: 'UK', contact: 'John', email: 'factory2@gmail.com', telephone: '1237266343')
# . . .
User.delete_all
User.create(name: 'admin', department: 'Accounts', email: 'admin@admin.com', password: 'admin', admin: '1')
User.create(name: 'commercial', department: 'Commercial', email: 'commercial@gmail.com', password: '123', admin: '0')
User.create(name: 'accounts', department: 'Accounts', email: 'accounts@gmail.com', password: '123', admin: '0')
User.create(name: 'factory1', department: 'Factory', email: 'factory1@gmail.com', factory_id: '1', password: '123', admin: '0')
User.create(name: 'factory2', department: 'Factory', email: 'factory2@gmail.com', factory_id: '2', password: '123', admin: '0')

Bank.delete_all
Bank.create(name: 'Fortis Bank SA/NV - USD', account: '43518003', sort_code: '40-52-62',
            bic: 'bic bank 1', iban: 'GB49 GEBA 4052 6243 5180 03', swift: 'GEBAGB23',
            notice: 'This debt has been assigned to and purchased by Fortis Commercial Finance Limited (Fortis)
            with whom we have an invoice finance agreement.
            Payments should be made to this company as trustees for Fortis.',
            address: 'Camomile Court
            23 Camomile Street
            London EC3 7PP')
Bank.create(name: 'Fortis Bank SA/NV -GBP', account: '43518002', sort_code: '40-52-62',
            bic: 'bic bank 2', iban: 'GB49 GEBA 4052 6243 5180 02', swift: 'GEBAGB22',
            notice: 'This debt has been assigned to and purchased by Fortis Commercial Finance Limited (Fortis)
            with whom we have an invoice finance agreement.
            Payments should be made to this company as trustees for Fortis.',
            address: 'Camomile Court
            23 Camomile Street
            London EC3 7PP')
# . . .

