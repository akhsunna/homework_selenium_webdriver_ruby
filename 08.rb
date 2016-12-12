require "selenium-webdriver"

puts 'Sign in & edit username'

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "https://www.utest.com/"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.find_element(:xpath, '/html/body/div[3]/div[1]/div[2]/div/div/a[1]').displayed? }
driver.find_element(:xpath, '/html/body/div[3]/div[1]/div[2]/div/div/a[1]').click
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.find_element(:name, 'username').displayed? && driver.find_element(:name, 'password').displayed? }
driver.find_element(:name, 'username').send_keys('akhsunna4@gmail.com')
driver.find_element(:name, 'password').send_keys('Password4444')
driver.find_element(:xpath, '/html/body/div/div/form/button').click

sleep 5

driver.get 'https://www.utest.com/account-setting'

sleep 10

input = driver.find_element(:xpath, '/html/body/div[3]/div[2]/div[2]/div/div[2]/div[4]/div/div[1]/div/form/div[3]/input')
input.clear
input.send_keys('akhsunna44')

sleep 2

driver.find_element(:xpath, '/html/body/div[3]/div[2]/div[2]/div/div[2]/div[4]/div/div[1]/div/form/div[9]/input').click

sleep 10

puts driver.find_element(:xpath, '/html/body/div[1]/div/div[1]/div/div[2]/div/p[2]/a').text == 'akhsunna44'

driver.quit
