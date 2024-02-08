#single_S3

 resource "aws_s3_bucket" "s3_buckett_1" {
  bucket = "vaibhavv1234"
  tags={
    name="bucket_1"
    Environment="Dev"
  }
 }

# variable "bucket_names" {
#   default = ["vbucket1","vbucket2","vbucket3"]
# }


# resource "aws_s3_bucket" "vaibhavbucket" {
#   count = length(var.bucket_names)
#   bucket = var.bucket_names[count.index]
#   force_destroy = true
# }



variable "number_count" {
  default = 3
}

# create buckets
resource "aws_s3_bucket" "buck-4321" {
  count = var.num_count
  bucket = "buck-4321-${count.index+1}"
  force_destroy = true
  tags = {
    name="buck-4321-${count.index+1}"
    Environment="Production"
  }
}


# #for_each
# resource "aws_s3_bucket" "rg" {

#   for_each = var.for_each_loop
#  bucket = each.value

# }
variable "security_groups" {
  description = "Map of security group configurations"
  type        = map(string)
  default = {
    sg1 = "description1"
    sg2 = "description2"
    sg3 = "description3"
  }
}

resource "aws_s3_bucket" "example" {
  for_each = var.security_groups

  bucket= each.value
  # description = each.value
}