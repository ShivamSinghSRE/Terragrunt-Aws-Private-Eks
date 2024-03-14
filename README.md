# Terragrunt


## Installation

Windows 


```bash
choco install terragrunt
```
macOS 


```bash
brew install terragrunt
```
Linux 


```bash
pacman -S terragrunt
```


## Setup
Before we get started, I will create an S3 bucket in the AWS account which I will use to store the Terraform state file

```bash
aws s3api create-bucket \
          --bucket terragrunt-remote-backend \
          --region ap-southeast-2
Terragrunt configuration is defined in a terragrunt.hcl file. This uses the same HCL syntax as Terraform itself. The folder structure is simple and only contains 2 hcl files.

.
├── eks
│   └── terragrunt.hcl
└── terragrunt.hcl

Deployment of Infrastructure as Code

Now that there is a basic setup of the resources, I will install terragrunt CLI on my MacBook using brew install terragrunt command. Terragrunt forwards all Terraform commands such as init , plan and apply to Terraform. It does have some special commands which can be noted in the Terragrunt CLI options documentation.

terragrunt run-all init — Initialize the Terraform modules for all Terragrunt folders

terragrunt run-all plan — Display the plan of the stack that is being deployed

terragrunt run-all apply — Apply the plan to create the resources

The run-all the command finds the modules recursively in all folders. It also adds a -autoapprove flag to the CLI arguments.
## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
