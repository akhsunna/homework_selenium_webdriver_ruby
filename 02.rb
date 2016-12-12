require "selenium-webdriver"

puts 'Registration form'

def send_keys_to_input(input_name, text)
  input = @driver.find_element(:name, input_name)
  input.click
  input.clear
  sleep 1
  input.send_keys text
end

@driver = Selenium::WebDriver.for :firefox
@driver.navigate.to "https://www.utest.com/"

element = @driver.find_element(
  :xpath, 
  '/html/body/div[3]/div[1]/div[2]/div/div/a[2]'
)
element.click

send_keys_to_input('firstName', "Anna")
send_keys_to_input('lastName', "Molly")
send_keys_to_input('email', "akhsunna4@gmail.com")
send_keys_to_input('username', "akhsunna4")
send_keys_to_input('birth', "1995")
send_keys_to_input('postal', "29000")
send_keys_to_input('password', "12345678")
send_keys_to_input('confirmPassword', "12345678")

@driver.quit
