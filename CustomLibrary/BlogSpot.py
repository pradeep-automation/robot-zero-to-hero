from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class BlogSpot:
    def __init__(self):
        self.sellib=BuiltIn().get_library_instance('SeleniumLibrary')

    @keyword
    def click_the_men_item(self, text):

        all_menu = self.sellib.get_webelements("xpath://div[@id='wikipedia-search-result-link']")
        index = 1
        for item in all_menu:
            if text == item.text:

                self.sellib.click_link(f"xpath:(//div[@id='wikipedia-search-result-link']/a)[{index}]")
            index += 1


    @keyword
    def click_all_the_men_item(self):
        all_menu = self.sellib.get_webelements("xpath://div[@id='wikipedia-search-result-link']")

        for i in range(1,len(all_menu)):
            self.sellib.click_element(f"xpath:(//div[@id='wikipedia-search-result-link']/a)[{i}]")


