# METADATA
# title: "Make sure IAM password policy requires minimum length of 14 or greater."
# description: "Passwords that are too short or too simple can be easily guessed or cracked, which can lead to unauthorized access to sensitive resources."
# scope: package
# related_resources:
# - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy#minimum_password_length
# custom:
#   id: CB_TFAWS_009
#   severity: MEDIUM
package lib.terraform.CB_TFAWS_009

import future.keywords.in 


isvalid(block){
	block.Type == "resource"
    block.Labels[_] == "aws_iam_account_password_policy"
}

resource [resource]{
    block := pass[_]
	resource := concat(".", block.Labels)
} 
resource [resource]{
    block := fail[_]
	resource := concat(".", block.Labels)
} 

pass[resource]{
    resource := input[_]
	isvalid(resource)
    maxPasswordLength := to_number(resource.Attributes.minimum_password_length)
    maxPasswordLength >= 14
}

fail[block] {
    block := input[_]
	isvalid(block)
   	not pass[block]
}

passed[result] {
	block := pass[_]
	result := { "message": "'aws_iam_account_password_policy' 'minimum_password_length' is set properly.",
                "snippet": block}
}

failed[result] {
    block := fail[_]
	result := { "message": "'aws_iam_account_password_policy' 'minimum_password_length' should be set to 14 or greater",
                "snippet": block }
}