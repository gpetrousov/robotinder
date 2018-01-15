require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://tinder.com"

sleep 5

# find the login with facebook button
element = driver.find_element(:xpath, "//button[contains(.,'Login with Facebook')]")

# push da button;opens a popup for fb login
element.click

# get all windows by ID
all_window_handles = driver.window_handles()

# save last window (popup) id
popup_window = driver.window_handles.last

# switch to popup window
driver.switch_to.window(driver.window_handles.last)

# fill the form
driver.find_element(:id, 'email').send_keys# 'email'
driver.find_element(:id, 'pass').send_keys# 'password'

# find log In button
#id="email"
#name="email"
element = driver.find_element(:name, "login")

# You are not logged in to tinder
element.click

# switch to the first window
driver.switch_to.window(driver.window_handles.last)

sleep 3
# next #1
element = driver.find_element(:xpath, "//button[contains(.,'Next')]").click
sleep 1
element = driver.find_element(:xpath, "//button[contains(.,'Next')]").click
sleep 1
# great
element = driver.find_element(:xpath, "//button[contains(.,'Great!')]").click
sleep 1
# ok got it
element = driver.find_element(:xpath, "//button[contains(.,'Ok, got it!')]").click

# initiate right swiping logic here
while true
	# send right arrow key to the driver
	driver.action.send_keys("\ue014").perform
	sleep 1
end

puts driver.title

#driver.quit