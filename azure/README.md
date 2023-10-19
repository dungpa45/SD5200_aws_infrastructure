# SD5200_azure_infrastructure

Provision codes and manifest files will be stored in this repository.

## Requirement

You must login azure cli:
<https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli>

> _If you using WSL on Windows_
>
> export your browser you are currently using, Example: 
>
> `export BROWSER='/mnt/c/Program Files/Mozilla Firefox/firefox.exe'`

`az login`

Or you want to login into your tenant

`az login --tenant "tenant_id"`

![Alt text](images/image.png)
![Alt text](images/image-1.png)

Done to login azure cli

## Terraform

Run 3 divine commands

> `terraform init`
>
> `terraform plan -var-file="terraform.tfvars"`
>
> `terraform apply`

Wait about 6 minutes and we will complete

![Alt text](images/image-2.png)

## Checking resources on Azure console

My main resource group

![Alt text](images/image-3.png)

AKS Resource group

![Alt text](images/image-4.png)

I provision AKS and Worker nodes in different vnet

![Alt text](images/image-5.png)
