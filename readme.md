# OVERVIEW
This project is a guide as to what is required to utilize the terraform modules

> Keep in mind that during execution of terraform commands all .tf files are loaded and evaluated.


## EACH PROJECT SHOULD
Include the following files: (even if they are empty)
* .gitignore (what files and directories to exclude)
* readme.md (instructions for bitbucket)
* main.tf (entry point for terraform code)
* folder for each environment
  * backend.tf that stores state for each environment in a different folder
  * terraform.tfvars which contain environment specific values
  * relative symbolic link to the main.tf in root of directory where all setup will be defined
    ```
    ln -s -r main.tf prod/main.tf
    ln -s -r main.tf staging/main.tf 
    ```

### INITIALIZE
If ...
* backend is modified
* new module is added
* module tag is updated

**be sure to initialize first**
```
cd {{ environment_folder }}
terraform init
```
### PLAN
Before executing check what it will do
It is a good idea to initialize and apply an empty state file first so you can see changes in plan
```
cd {{ environment_folder }}
terraform plan
```
### APPLY
```
cd {{ environment_folder }}
terraform apply
```

### DESTROY
```
cd {{ environment_folder }}
terraform destroy
```
