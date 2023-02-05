require "aws-sdk-dynamodb"
require 'json'
require 'logger'


def hello(event:, context:)
  logger = Logger.new('./development.log') if event["headers"]["host"] == "localhost:3000" # ローカルでの開発時のログ出力用
  logger.info('## EVENT hello')
  logger.info(event)
  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event
    }.to_json
  }
end

def dynamodb_access(event:, context:)
  logger = Logger.new('./development.log') if event["headers"]["host"] == "localhost:3000" # ローカル環境でのログ出力用
  logger.info('## EVENT dynamodb_access')
  logger.info(event)
  Aws.config.update({
    region: 'ap-northeast-1',
    endpoint:'http://host.docker.internal:8000'
  })
  ddb = Aws::DynamoDB::Client.new

  result = ddb.list_tables
  result.table_names.each do |table|
    puts table
  end
end