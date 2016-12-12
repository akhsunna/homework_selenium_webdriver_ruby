require "selenium-webdriver"
puts 'Windows'

driver = Selenium::WebDriver.for :firefox
puts 'OPEN BROWSER'

if driver.manage.all_cookies.count > 0
  driver.manage.delete_all_cookies
  puts 'Cookies deleted'
end

sleep 3

driver.navigate.to "https://www.duolingo.com/"
duolingo_window = driver.window_handle
puts 'Open Duolingo'

if driver.manage.all_cookies.count > 0
  driver.manage.delete_all_cookies
  puts 'Cookies deleted'
end

sleep 3

body = driver.find_element(:tag_name => 'body')
body.send_keys(:control, 't')

puts 'Open new window'

new_window = driver.window_handles.last
driver.switch_to.window(new_window)
puts 'Select new window'

driver.get('https://github.com/')
puts 'Redirect to github'

if driver.manage.all_cookies.count > 0
  driver.manage.delete_all_cookies
  puts 'Cookies deleted'
end

sleep 3

driver.switch_to.window(duolingo_window)

puts 'Select Duolingo'

sleep 3

body = driver.find_element(:tag_name => 'body')
body.send_keys(:control, 'w')
driver.switch_to.window(new_window)
puts 'Close Duolingo'

sleep 3

driver.quit

puts 'CLOSE BROWSER'

driver = Selenium::WebDriver.for :firefox
puts 'OPEN BROWSER'

puts "Cookies count: #{driver.manage.all_cookies.count}"

sleep 3

driver.quit

