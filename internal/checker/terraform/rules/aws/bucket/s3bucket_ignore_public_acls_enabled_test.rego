package lib.terraform.CB_TFAWS_052

test_s3_bucket_ignore_public_acls_enabled {
    result := passed with input as[
                                {
                                "Type": "resource",
                                "Labels": [
                                "aws_s3_bucket_public_access_block",
                                "example"
                                ],
                                "Attributes": {
                                "block_public_acls": true,
                                "block_public_policy": true,
                                "bucket": "aws_s3_bucket.example.id",
                                "ignore_public_acls": true,
                                "restrict_public_buckets": true
                                },
                                "Blocks": [],
                                "line_range": {
                                "endLine": 8,
                                "startLine": 1
                                }
                                },
                                {
                                "Type": "resource",
                                "Labels": [
                                "aws_s3_bucket",
                                "example"
                                ],
                                "Attributes": {
                                "bucket": "example-bucket"
                                },
                                "Blocks": [],
                                "line_range": {
                                "endLine": 13,
                                "startLine": 10
                                }
                                }
                                ]
    count(result) == 1
}

test_s3_bucket_ignore_public_acls_false {
    result := failed with input as [
                                {
                                "Type": "resource",
                                "Labels": [
                                "aws_s3_bucket_public_access_block",
                                "example"
                                ],
                                "Attributes": {
                                "block_public_policy": false,
                                "bucket": "aws_s3_bucket.example.id",
                                "ignore_public_acls": false,
                                "restrict_public_buckets": true
                                },
                                "Blocks": [],
                                "line_range": {
                                "endLine": 8,
                                "startLine": 1
                                }
                                },
                                {
                                "Type": "resource",
                                "Labels": [
                                "aws_s3_bucket",
                                "example"
                                ],
                                "Attributes": {
                                "bucket": "example-bucket"
                                },
                                "Blocks": [],
                                "line_range": {
                                "endLine": 13,
                                "startLine": 10
                                }
                                }
                                ]
    count(result) == 1
}