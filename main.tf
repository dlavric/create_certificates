data "aws_route53_zone" "zone" {
  name = "tf-support.hashicorpdemo.com"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = "daniela@hashicorp.com"
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = "daniela-k8s.${data.aws_route53_zone.zone.name}"
  subject_alternative_names = ["daniela-k8s.${data.aws_route53_zone.zone.name}"]
  #recursive_nameservers        = ["8.8.8.8:53"]
  disable_complete_propagation = true
  # depends_on                   = [acme_registration.reg]

  dns_challenge {
    provider = "route53"
    config = {
      AWS_HOSTED_ZONE_ID = data.aws_route53_zone.zone.zone_id
    }
  }
}

resource "aws_s3_bucket" "s3bucket" {
  bucket = "daniela-fdo-bucket"

  tags = {
    Name        = "Daniela FDO Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "object" {
  for_each = toset(["certificate_pem", "issuer_pem", "private_key_pem"])
  bucket   = aws_s3_bucket.s3bucket.bucket
  key      = "ssl-certs/${each.key}"
  content  = lookup(acme_certificate.certificate, "${each.key}")
}