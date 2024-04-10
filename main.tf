

# module "lakeformation" {
#   source  = "app.terraform.io/my-birla-org/lakeformation/aws"
#   version = "0.9.4"

#   bucket_register = var.lf_register.bucket_arn
#   glue_arn= "arn:aws:iam::809244893916:role/AWSRoleGlue"

#   lf_permissions=var.lf_permissions 

# }


module "lambda" {
  source  = "app.terraform.io/my-birla-org/lambda/aws"
  version = "0.9.1"

   for_each = { for function in var.lambda_functions: function.function_name => function  if length(var.lambda_functions)>0 }
     function_name = each.value.function_name
     handler = each.value.handler
     runtime = each.value.runtime
     ephemeral_storage_size = each.value.ephemeral_storage_size
     role_arn = each.value.lambda_role_arn

     source_file_name = each.value.source_file_name
     output_file_name = each.value.output_file_name
     env_variables = each.value.env_variables

     tags = var.custom_tags
}





# AppFlow Module

# module "aws_appflow_mod" {
#   source = "./modules/appflow"
# }

