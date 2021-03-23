# GitHub Project Module for Consul Terraform Sync

This Terraform module creates a GitHub repo and projects. Using this module in automation with [Consul Terraform Sync (CTS)](https://www.consul.io/docs/nia) will dynamically create or delete GitHub projects based off of configured services. This module is useful for testing CTS with a provider that supports multiple accounts without setting up infrastructure.

## Feature

The module uses the `github` Terraform provider to create a repository named 'cts-labels' in the configured GitHub account. It then creates GitHub TODO: Consul-pink issue labels within this repository. The labels are named after the monitored Consul service instances and have the description of the service instance address and port.

## Requirements

### Ecosystem Requirements

| Ecosystem | Version |
|-----------|---------|
| [consul](https://www.consul.io/downloads) | >= 1.7 |
| [consul-terraform-sync](https://www.consul.io/docs/nia) | >= 0.1.0 |
| [terraform](https://www.terraform.io) | >= 0.13 |

### Terraform Providers

| Name | Version |
|------|---------|
| github | >= 4.5.2 |

## Setup

A GitHub personal access token is required in order to use this module:
1. Create a GitHub account
1. Create a [personal access token](https://docs.GitHub.com/en/GitHub/authenticating-to-GitHub/creating-a-personal-access-token) in GitHub

## Usage

**User Config for Consul Terraform Sync**

See [Securely Configure Terraform Providers](https://www.consul.io/docs/nia/configuration#securely-configure-terraform-providers) for alternatives to directly inserting token in config file.

example.hcl
```hcl
task {
  name           = "task_b"
  source         = "lornasong/gh_project/cts"
  version        = "0.0.1"
  providers      = ["github"]
  services       = ["api"]
}

terraform_provider "github" {
  token = "<GIT PERSONAL ACCESS TOKEN>"
}
```
