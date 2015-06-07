require "aws-sdk"
require "json"

require_relative 'config'

def doki(from)
  from ||= 'unknown'
  sns = Aws::SNS::Client.new(
    region: REGION,
    access_key_id: ACCCESS_KEY_ID,
    secret_access_key: SECRET_ACCESS_KEY
  )

  json = {
    from: from,
    timestamp: Time.now.strftime("%s").to_i,
    message: "どきどきしてる？",
    timestring: Time.now,
  }
  resp = sns.publish(
    target_arn: ARN,
    # required
    message: JSON.generate(json),
    subject: "たいとる",
    # message_structure: "messageStructure",
    # message_attributes: {
    #   "String" => {
    #     # required
    #     data_type: "String",
    #     string_value: "String",
    #     binary_value: "Binary<String,IO>",
    #   },
    # },
  )

  return resp[:message_id]
end
