require 'yaml'
path = './config.yml'
CONFIG = YAML::load(File.open(path))
TEST_APIKEY = CONFIG['test_apikey']
BASE_PATH_USERS_SERVICE = CONFIG['base_path_users_service']