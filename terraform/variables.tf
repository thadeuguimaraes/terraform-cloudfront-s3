variable "project_name" {
  type        = string
  description = "Project Name t.h. dcacademy"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "environment" {
  type        = string
  description = "Environment of application t.h. test,uat,prod"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block used for VPC"
  default     = "10.0.0.0/16"
}

variable "backend_port" {
  type        = string
  description = "Port used by backend application"
}