require 'yaml'
path = './config.yml'
CONFIG = YAML::load(File.open(path))
TEST_APIKEY = CONFIG['test_apikey']
BASE_PATH = CONFIG['base_path']