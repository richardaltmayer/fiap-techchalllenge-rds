terraform {
  cloud {
    organization = "fiap_techchallenge"

    workspaces {
      name = "fiap-techchallenge"
    }
  }
}

provider "aws" {
  access_key = ${{ secrets.AWS_ACCESS_KEY }}
  secret_key = ${{ secrets.AWS_SECRET_KEY }}
  region     = "us-east-1"
}

resource "aws_db_instance" "fiap-techchallenge-rds" {
  engine = "mysql"
  engine_version = "8.0.33"
  allocated_storage = 20
  instance_class = "db.t3.micro"
  storage_type = "gp2"
  identifier = "fiap-techchallenge-db"
  username = "admin"
  password = "passw0rd!132"
  publicly_accessible = true
  skip_final_snapshot = true

  tags = {
    Name = "fiap-techchallenge"
  }
}