require "selenium-webdriver"

puts 'Twitter link'

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "https://www.utest.com/"

sleep 4

driver.find_element(:class, 'icon-twitter').click

sleep 4

new_window = driver.window_handles.last
driver.switch_to.window(new_window)

puts driver.current_url == 'https://twitter.com/utest'

driver.quit
