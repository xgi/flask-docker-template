from proj import app

import unittest

class AppTestCase(unittest.TestCase):

    def setUp(self):
        app.config['TESTING'] = True
        self.app = app.test_client()

    def test_online(self):
        resp = self.app.get('/')
        assert resp.status_code == 200

if __name__ == '__main__':
    unittest.main()
