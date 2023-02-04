require 'json'
require "aws-sdk-dynamodb"

def hello(event:, context:)
  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event
    }.to_json
  }
end

def dynamodb_access(event:, context:)
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