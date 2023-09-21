# create_certificates
This is a test repository that helps creating certificates with Let's Encrypt for testing purposes

## Pre-requisites

- [X] [Terraform](https://www.terraform.io/downloads)
- [X] [AWS Account](https://aws.amazon.com/resources/create-account/)

## Steps on how to use this repository

- Clone this repository:
```shell
git clone https://github.com/dlavric/create-certificates.git
```

- Go to the directory where the repo is stored:
```shell
cd create-certificates
```


- Export your AWS Keys on your terminal
```shell
export AWS_REGION="us-west-1"
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
export AWS_SESSION_TOKEN=...                  
```

- Initialize Terraform to download the providers and the modules
```shell
terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "5.17.0"...
- Finding vancluever/acme versions matching "2.17.2"...
- Installing hashicorp/aws v5.17.0...
- Installed hashicorp/aws v5.17.0 (signed by HashiCorp)
- Installing vancluever/acme v2.17.2...
- Installed vancluever/acme v2.17.2 (self-signed, key ID F282F2CFA56C3D69)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

- Apply the changes to create the infrastructure
```shell
terraform apply 
``` 

- Check the output isthe following
```shell
data.aws_route53_zone.zone: Reading...
data.aws_route53_zone.zone: Read complete after 1s [id=Z01203873BDCKYK050ZYI]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # acme_certificate.certificate will be created
  + resource "acme_certificate" "certificate" {
      + account_key_pem               = (sensitive value)
      + certificate_domain            = (known after apply)
      + certificate_not_after         = (known after apply)
      + certificate_p12               = (sensitive value)
      + certificate_pem               = (known after apply)
      + certificate_url               = (known after apply)
      + common_name                   = "daniela-k8s.tf-support.hashicorpdemo.com"
      + disable_complete_propagation  = true
      + id                            = (known after apply)
      + issuer_pem                    = (known after apply)
      + key_type                      = "2048"
      + min_days_remaining            = 30
      + must_staple                   = false
      + pre_check_delay               = 0
      + private_key_pem               = (sensitive value)
      + revoke_certificate_on_destroy = true
      + subject_alternative_names     = [
          + "daniela-k8s.tf-support.hashicorpdemo.com",
        ]

      + dns_challenge {
          + config   = (sensitive value)
          + provider = "route53"
        }
    }

  # acme_registration.reg will be created
  + resource "acme_registration" "reg" {
      + account_key_pem  = (sensitive value)
      + email_address    = "daniela@hashicorp.com"
      + id               = (known after apply)
      + registration_url = (known after apply)
    }

  # aws_s3_bucket.s3bucket will be created
  + resource "aws_s3_bucket" "s3bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "daniela-fdo-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "Dev"
          + "Name"        = "Daniela FDO Bucket"
        }
      + tags_all                    = {
          + "Environment" = "Dev"
          + "Name"        = "Daniela FDO Bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # aws_s3_object.object["certificate_pem"] will be created
  + resource "aws_s3_object" "object" {
      + acl                    = (known after apply)
      + bucket                 = "daniela-fdo-bucket"
      + bucket_key_enabled     = (known after apply)
      + checksum_crc32         = (known after apply)
      + checksum_crc32c        = (known after apply)
      + checksum_sha1          = (known after apply)
      + checksum_sha256        = (known after apply)
      + content                = (known after apply)
      + content_type           = (known after apply)
      + etag                   = (known after apply)
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "ssl-certs/certificate_pem"
      + kms_key_id             = (known after apply)
      + server_side_encryption = (known after apply)
      + storage_class          = (known after apply)
      + tags_all               = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_object.object["issuer_pem"] will be created
  + resource "aws_s3_object" "object" {
      + acl                    = (known after apply)
      + bucket                 = "daniela-fdo-bucket"
      + bucket_key_enabled     = (known after apply)
      + checksum_crc32         = (known after apply)
      + checksum_crc32c        = (known after apply)
      + checksum_sha1          = (known after apply)
      + checksum_sha256        = (known after apply)
      + content                = (known after apply)
      + content_type           = (known after apply)
      + etag                   = (known after apply)
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "ssl-certs/issuer_pem"
      + kms_key_id             = (known after apply)
      + server_side_encryption = (known after apply)
      + storage_class          = (known after apply)
      + tags_all               = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_object.object["private_key_pem"] will be created
  + resource "aws_s3_object" "object" {
      + acl                    = (known after apply)
      + bucket                 = "daniela-fdo-bucket"
      + bucket_key_enabled     = (known after apply)
      + checksum_crc32         = (known after apply)
      + checksum_crc32c        = (known after apply)
      + checksum_sha1          = (known after apply)
      + checksum_sha256        = (known after apply)
      + content                = (sensitive value)
      + content_type           = (known after apply)
      + etag                   = (known after apply)
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "ssl-certs/private_key_pem"
      + kms_key_id             = (known after apply)
      + server_side_encryption = (known after apply)
      + storage_class          = (known after apply)
      + tags_all               = (known after apply)
      + version_id             = (known after apply)
    }

  # tls_private_key.private_key will be created
  + resource "tls_private_key" "private_key" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 2048
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

Enter a value: yes

tls_private_key.private_key: Creating...
tls_private_key.private_key: Creation complete after 1s [id=ecc9008fade04b968d27714c0ab4a6d1c1cc69c9]
acme_registration.reg: Creating...
aws_s3_bucket.s3bucket: Creating...
acme_registration.reg: Creation complete after 1s [id=https://acme-staging-v02.api.letsencrypt.org/acme/acct/119260304]
acme_certificate.certificate: Creating...
aws_s3_bucket.s3bucket: Creation complete after 2s [id=daniela-fdo-bucket]
acme_certificate.certificate: Still creating... [10s elapsed]
acme_certificate.certificate: Still creating... [20s elapsed]
acme_certificate.certificate: Still creating... [30s elapsed]
acme_certificate.certificate: Still creating... [40s elapsed]
acme_certificate.certificate: Still creating... [50s elapsed]
acme_certificate.certificate: Still creating... [1m0s elapsed]
acme_certificate.certificate: Still creating... [1m10s elapsed]
acme_certificate.certificate: Creation complete after 1m16s [id=45ebbad9-78f9-a8ab-87da-bcb485db08cc]
aws_s3_object.object["certificate_pem"]: Creating...
aws_s3_object.object["issuer_pem"]: Creating...
aws_s3_object.object["private_key_pem"]: Creating...
aws_s3_object.object["private_key_pem"]: Creation complete after 0s [id=ssl-certs/private_key_pem]
aws_s3_object.object["certificate_pem"]: Creation complete after 0s [id=ssl-certs/certificate_pem]
aws_s3_object.object["issuer_pem"]: Creation complete after 0s [id=ssl-certs/issuer_pem]

Apply complete! Resources: 7 added, 0 changed, 0 destroyed.
```

- Confirm the certificates have been saved to your AWS S3 Bucket
![AWS S3 Bucket 1](https://github.com/dlavric/create-certificates/blob/main/pictures/bucket1.png)
![AWS S3 Bucket 2](https://github.com/dlavric/create-certificates/blob/main/pictures/bucket2.png)
![AWS S3 Bucket 3](https://github.com/dlavric/create-certificates/blob/main/pictures/bucket3.png)

- Click on the certificate and notice that it can also be downloaded locally
![AWS S3 Bucket 4](https://github.com/dlavric/create-certificates/blob/main/pictures/bucket4.png)

- Destroy the resources
```shell
terraform destroy
```

- Confirm the output will destroy 7 resources
```shell
aws_s3_object.object["certificate_pem"]: Destroying... [id=ssl-certs/certificate_pem]
aws_s3_object.object["issuer_pem"]: Destroying... [id=ssl-certs/issuer_pem]
aws_s3_object.object["private_key_pem"]: Destroying... [id=ssl-certs/private_key_pem]
aws_s3_object.object["private_key_pem"]: Destruction complete after 0s
aws_s3_object.object["issuer_pem"]: Destruction complete after 0s
aws_s3_object.object["certificate_pem"]: Destruction complete after 0s
aws_s3_bucket.s3bucket: Destroying... [id=daniela-fdo-bucket]
acme_certificate.certificate: Destroying... [id=45ebbad9-78f9-a8ab-87da-bcb485db08cc]
acme_certificate.certificate: Destruction complete after 1s
acme_registration.reg: Destroying... [id=https://acme-staging-v02.api.letsencrypt.org/acme/acct/119260304]
acme_registration.reg: Destruction complete after 1s
tls_private_key.private_key: Destroying... [id=ecc9008fade04b968d27714c0ab4a6d1c1cc69c9]
tls_private_key.private_key: Destruction complete after 0s
aws_s3_bucket.s3bucket: Still destroying... [id=daniela-fdo-bucket, 10s elapsed]
aws_s3_bucket.s3bucket: Destruction complete after 16s

Destroy complete! Resources: 7 destroyed.
```

## Reference documentation

- [Blog post for Let's Encrypt Certs with Terraform](https://www.terraform.io/downloads)
- [Vancluever acme certificate provider for Terraform](https://registry.terraform.io/providers/vancluever/acme/latest/docs/resources/certificate)
- [AWS provider for Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)