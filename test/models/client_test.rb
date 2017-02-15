require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  
  test "create client with good input" do
    name = "Leeroy Jenkins"
    address = "1234 Fake St, Edmonton, Alberta"
    phone = "780-951-9085"
    email = "leeroyjenkins@gmail.com"
    licos = 40210.00
    aish = 91231.00
    socialAssistance = 1231.00
    pets = 1
    client = Client.new(name: name, address: address, phoneNumber: phone, email: email, \
                        licos: licos, aish: aish ,socialAssistance: socialAssistance,\
                        pets:pets)
    assert client.valid?
  end

  test "create client with bad input - No HTTP response" do
    name = "Leeroy Jenkins"
    address = "1234 Fake St, Edmonton, Alberta"
    phone = "780951-85"
    email = "leeroyjenkins.gmail.com"
    licos = "PING"
    aish =  -10123
    socialAssistance =
    pets = 1
    client = Client.new(name: name, address: address, phoneNumber: phone, email: email, \
                        licos: licos, aish: aish ,socialAssistance: socialAssistance,\
                        pets:pets)
    assert_not client.valid?
    assert_equal ["Email is invalid format"], client.errors.messages[:email]
    assert_equal ["is not a number"], client.errors.messages[:licos]
    assert_equal ["must be greater than or equal to 0"], client.errors.messages[:aish]
  end


end
