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

driver.navigate.to "https://www.utest.com/courses"

sleep 8

driver.find_element(:xpath, '/html/body/div[3]/div[2]/div[2]/div[1]/div/div[2]/div[2]/div/div[1]/course-feed-item[1]/div/div[2]/a').click

sleep 15

driver.switch_to.frame driver.find_element(:class, 'wistia_embed')

length = driver.find_element(:xpath, '/html/body/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div[2]/div[1]/div').text
puts 'VIDEO LENGTH: ' + length

play_btn = driver.find_element(:xpath, '/html/body/div/div/div/div[2]/div[2]/div/div/div[8]/div/div/div/div/div')
play_btn.click

sleep 20

driver.quit
