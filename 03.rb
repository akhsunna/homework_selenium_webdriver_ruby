require "selenium-webdriver"

puts 'Start test...'

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "https://www.utest.com/"

driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[1]/div/div/ul/li[2]/a').click

puts 'Open cources page'

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.find_element(:xpath, '/html/body/div[3]/div[2]/div[2]/div[1]/div/div[2]/div[1]/label').displayed? }
driver.find_element(:xpath, '/html/body/div[3]/div[2]/div[2]/div[1]/div/div[2]/div[1]/label').click

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.find_element(:xpath, '/html/body/div[3]/div[2]/div[2]/div[1]/div/div[2]/div[1]/ul/li[6]').displayed? }
driver.find_element(:xpath, '/html/body/div[3]/div[2]/div[2]/div[1]/div/div[2]/div[1]/ul/li[6]').click

puts 'Filter cources'
puts "1 PAGE"

i = 1
while true
  load_more = driver.find_element(:xpath, '/html/body/div[3]/div[2]/div[2]/div[1]/div/div[2]/div[2]/div/div[1]/div/a')

  puts 'Load more...'
  sleep 5 

  if load_more.displayed?
    load_more.click
    i += 1
    puts "#{i} PAGEs"
  else
    sum = driver.find_elements(:tag_name, 'course-feed-item').count
    break 
  end
end

driver.quit

puts "TOTAL COUNT: #{sum} cources"
