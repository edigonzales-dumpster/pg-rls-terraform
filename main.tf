variable "environment" {
}

provider "digitalocean" {}


resource "digitalocean_database_cluster" "postgres-rls-example" {
  name       = "postgres-rls-example-cluster"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}

resource "digitalocean_project" "postgres-rls-example" {
    name        = "PG-RLS-${var.environment}"
    description = "Postgres Row Level Security"
    purpose     = "Web Application"
    resources   = [digitalocean_database_cluster.postgres-rls-example.urn]
}

