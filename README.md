# create_certificates
This is a test repository that helps creating certificates with Let's Encrypt for testing purposes

## Pre-requisites

- [X] [Terraform](https://www.terraform.io/downloads)

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