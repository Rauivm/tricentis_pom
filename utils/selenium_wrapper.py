try:
    import allure
    ALLURE_AVAILABLE = True
except ImportError:
    ALLURE_AVAILABLE = False
from robot.libraries.BuiltIn import BuiltIn

class SeleniumWrapper:
    ROBOT_LIBRARY_SCOPE = "TEST SUITE"
    ROBOT_LISTENER_API_VERSION = 2

    def __init__(self):
        self.ROBOT_LIBRARY_LISTENER = self

    def _start_suite(self, name, attrs):
        BuiltIn().set_library_search_order(__name__)

    def capture_page_screenshot(self, *args, **kwargs):
        target_lib = BuiltIn().get_library_instance('SeleniumLibrary')
        path = target_lib.capture_page_screenshot(*args, **kwargs)
        allure.attach.file(
            path,
            name="page_screenshot",
            attachment_type=allure.attachment_type.JPG
        )
        return path

selenium_wrapper = SeleniumWrapper