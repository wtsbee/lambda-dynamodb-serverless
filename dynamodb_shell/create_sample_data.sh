aws dynamodb \
  --region ap-northeast-1 \
  --endpoint-url http://host.docker.internal:8000 \
    put-item \
  --table-name SampleTable \
  --item '
    {
      "userId": {
        "N": "1"
       },
      "userName": {
        "S": "山田太郎"
      },
      "age": {
        "N": "30"
      },
      "contactNumber": {
        "S": "080-1234-5678"
      }
    }
  '