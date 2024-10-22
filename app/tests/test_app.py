import unittest
from mycompany_api.main import app

class MyCompanyAPITestCase(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_hello_world(self):
        response = self.client.get('/api/v1/hello')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Welcome to MyCompany API!', response.data)

if __name__ == '__main__':
    unittest.main()
