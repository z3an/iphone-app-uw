import unittest
from appium import webdriver
from appium.webdriver.common.touch_action import TouchAction
from appium.webdriver.common.multi_action import MultiAction
from time import sleep
import os

PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)
class emailTest(unittest.TestCase):
    def setUp(self):
        desired_caps = {}
        desired_caps['platformName'] = 'iOS'
        desired_caps['platformVersion'] = '11.1'
        desired_caps['deviceName'] = 'iPhone 8 Plus'
        desired_caps['app'] = PATH('/Users/anzepeng/Desktop/uw-app-afkbcxmdststttgtnqxylwdzepvh/Build/Products/Debug-iphonesimulator/uw-app.app')
        self.driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)


    def tearDown(self):
        self.driver.quit()

    def test_email(self):
        self.driver.find_element_by_name("search").click()
        sleep(1200)



if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(emailTest)
    unittest.TextTestRunner(verbosity=2).run(suite)