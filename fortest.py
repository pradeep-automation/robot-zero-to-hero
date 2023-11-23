import time

from selenium import webdriver
from selenium.webdriver import ActionChains, Keys
from selenium.webdriver.common.by import By
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class fortest:
    def __init__(self):
        self.sellib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def select_item_from(self, item):
        index = 1
        titles = self.sellib.get_webelements("css:h2[class='title']")
        for title in titles:
            if title.text == item:

                self.sellib.click_element(f"xpath:(//h2[@class='title'])[{index}]")
                break
            index = index+1
        time.sleep(3)






def select_item(param):
    driver = webdriver.Chrome()
    driver.get("https://demowebshop.tricentis.com/computers")
    driver.maximize_window()
    driver.implicitly_wait(10)
    ele_list = driver.find_elements(By.CSS_SELECTOR, "h2[class='title']")
    i = 1
    for ele in ele_list:
        if ele.text == param:
            i = i+1
            break
    driver.find_element(By.XPATH, f"(//h2[@class='title'])[{i}]").click()
    time.sleep(4)
# action = ActionChains(driver)
# action.send_keys()
# Keys



