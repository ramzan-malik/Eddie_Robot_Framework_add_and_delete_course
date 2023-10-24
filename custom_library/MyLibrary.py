import time

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library

class MyLibrary():

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")


    @keyword
    def hello_world(self):
        print("Hello G!")

    @keyword
    def delete_all_courses(self):
        initial_count = len(self.selLib.get_webelements("xpath=//tr[@role='row']"))

        while initial_count > 1:  # Ensure there's at least one row (header row) before entering the loop
            self.selLib.mouse_over("xpath=(//tr[@role='row'])[2]")  # Move to the first row
            self.selLib.click_element("xpath=//a[@title='Delete']")
            time.sleep(2)
            self.selLib.handle_alert(action="accept")
            time.sleep(2)
            initial_count -= 1










