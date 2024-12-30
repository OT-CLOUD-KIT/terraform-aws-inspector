variable "duration" {
  default     = 3600
  type        = number
  description = "Time duration for the assessment to run to"
}

variable "event" {
  type    = string
  default = "ASSESSMENT_RUN_STARTED"
}

variable "resource_group_tags" {
  type = map(string)
  default = {}
  description = "Tag values required to group your resources given to the resource group."  
}

