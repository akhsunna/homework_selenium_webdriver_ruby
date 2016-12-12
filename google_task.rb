require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"
duolingo_window = driver.window_handle

puts 'Open Google 1'
sleep 2

element = driver.find_element(:name, 'q')
element.send_keys "«Ефективне тестування програм»"
element.submit

puts 'Search with quotes'
sleep 4




links_1 = []
driver.find_elements(:class, "g").each do |link|
  links_1 << link.find_element(:tag_name, 'cite').text
end

driver.find_element(:id, 'navcnt').find_elements(:tag_name, 'a').first.click
sleep 3

driver.find_elements(:class, "g").each do |link|
  links_1 << link.find_element(:tag_name, 'cite').text
end



body = driver.find_element(tag_name: 'body')
body.send_keys(:control, 't')
new_window = driver.window_handles.last
driver.switch_to.window(new_window)
driver.get('http://google.com')

puts 'Open Google 2'
sleep 2

element = driver.find_element(:name, 'q')
element.send_keys "Ефективне тестування програм"
element.submit

puts 'Search without quotes'
sleep 4

links_2 = []
driver.find_elements(:class, "g").each do |link|
  links_2 << link.find_element(:tag_name, 'cite').text
end


puts 'Result: '
(links_1 & links_2).each_with_index do |link, i|
  puts "#{i+1}. #{link}"
end

driver.quit
