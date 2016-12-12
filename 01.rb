require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "https://www.utest.com/"

puts driver.title == 'uTest - The Professional Network for Testers'

driver.quit
