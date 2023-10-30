terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "fiap_techchallenge"

    workspaces {
      name = "fiap-techchallenge"
    }
  }
}

provider "aws" {
  access_key = "AKIAY3MORP6XO7UTCY2Q"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_db_instance" "fiap-techchallenge-rds" {
  engine = "mysql"
  engine_version = "8.0.33"
  allocated_storage = 20
  instance_class = "db.t3.micro"
  storage_type = "gp2"
  identifier = "fiap-techchallenge-db"
  username = secrets.db_username
  password = "passw0rd!132"
  publicly_accessible = true
  skip_final_snapshot = true

  tags = {
    Name = "fiap-techchallenge"
  }
}
