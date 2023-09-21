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
  account_key_pem              = acme_registration.reg.account_key_pem
  common_name                  = "daniela-k8s.${data.aws_route53_zone.zone.name}"
  subject_alternative_names    = ["daniela-k8s.${data.aws_route53_zone.zone.name}"]
  recursive_nameservers        = ["8.8.8.8:53"]
  disable_complete_propagation = true
  depends_on                   = [acme_registration.reg]

  dns_challenge {
    provider = "route53"
    config = {
      AWS_HOSTED_ZONE_ID = data.aws_route53_zone.zone.zone_id
    }
  }


}

resource "aws_acm_certificate" "certificate" {
  certificate_body  = acme_certificate.certificate.certificate_pem
  private_key       = acme_certificate.certificate.private_key_pem
  certificate_chain = acme_certificate.certificate.issuer_pem
}