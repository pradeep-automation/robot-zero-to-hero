import time

from selenium import webdriver
from selenium.webdriver import Keys
from selenium.webdriver.common.by import By

driver = webdriver.Chrome()
driver.maximize_window()
driver.get("https://demo.nopcommerce.com/")
driver.find_element(By.XPATH,"//input[@id='small-searchterms']").send_keys("phone", Keys.ENTER)
search_result = driver.find_elements(By.CSS_SELECTOR,'.item-grid h2')
for item in search_result:
    if item.text == "Nokia Lumia 1020":
        driver.find_element(By.XPATH,"//button[text()='Add to cart']").click()

time.sleep(2)

