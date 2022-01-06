# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

IotDevice.create({ uname: 'rbpi0-1', model: 'RaspberryPi Zero WH', desc: '1st pi zero'})
IotDevice.create({ uname: 'rbpi0-2', model: 'RaspberryPi Zero WH', desc: '2nd pi zero'})
IotDevice.create({ uname: 'rbpi0-4', model: 'RaspberryPi Zero WH', desc: '4th pi zero'})
IotDevice.create({ uname: 'BME280_BEACON_1', model: 'ESP32', desc: '1st ESP32'})

DeviceLocation.create({ loc_ident: 'WCL', desc: 'Walk-in Closet', iot_device_id: 1 })
DeviceLocation.create({ loc_ident: 'ECL', desc: 'Entrance Closet', iot_device_id: 2 })
DeviceLocation.create({ loc_ident: 'LIV', desc: 'Living Room', iot_device_id: 3 })
DeviceLocation.create({ loc_ident: 'FR', desc: 'Free Room', iot_device_id: 4 })

IpRestriction.create({ list_type: 'w', ip: '14.193.238.94', desc: 'Gake', enabled: true })
