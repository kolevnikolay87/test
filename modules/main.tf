module "terraform_test_module" {
 source  = "github.com/kolevnikolay87/test.git?ref=1.0.0"
 
   vpc_cidr                     = ""
#  argument_2                     = var.test_2
#  argument_3                     = var.test_3
}