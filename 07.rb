require "selenium-webdriver"

puts 'Sign in & video player test'

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

sleep 8

driver.navigate.to "https://www.utest.com/articles"

sleep 8

driver.find_element(:xpath, '/html/body/div[3]/div[2]/div[2]/div[1]/div/div[1]/div[2]/div[1]/div[1]/span/a').click
driver.navigate.refresh

sleep 5

driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[1]/ul/li[3]/a').click

sleep 3

count = driver.find_elements(:class, 'to-do-item').count

count = driver.find_elements(:class, 'to-do-item').count

driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[1]/div/div[3]/div[2]/div/div[2]/div/div[1]/div[2]').click

sleep 4

puts driver.find_elements(:class, 'to-do-item').count == count - 1

driver.quit
