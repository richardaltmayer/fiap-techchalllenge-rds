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
}

provider "aws" {
  region     = "us-east-1"
  access_key = "ASIAVNIY2D7V5RYKDJQO"
  secret_key = "WFSfGcPAdgsC9U223giVsVz0UnWstFdZGvULSmRc"
  token = "FwoGZXIvYXdzEDQaDF8XcyQTwcSV2HrDNiLFActv/PxDM3Of0gWKQQ/yoK12VG2PeHE5MhUWHCgnHYod/zAOy1/wU7E6M0crqqCHAMsWDaP46HCplIPUPsvjKsym2h9kliG5Lm5riMfKC1mXAUNCZQaF4EkDb0Xzgk0a7Ck6l/pLQ2R9ev3V5RUe7xbq9YUDVSmE2a36x+OSZeaUg7YfiNTfQZQ/bT1Di/hT7C60zSd3YyD2AOU/IDSSDwNDYaTu0VdC85pfam9esWKpKOZysuvQkuPJmnggSGk61Uo6FCCfKPi92q0GMi1waLdHN4dvEqnjIWpKQ3WD8NBs+Ad2NgMYFQoSMyQ0TR/CDHyCundP0dAQGvs="
}

data "aws_subnet" "subnet_1" {
  id = "subnet-0502770f7e2901bb7"
}

data "aws_subnet" "subnet_2" {
  id = "subnet-0ea4edbbcf6ed6739"
}

data "aws_subnet" "subnet_3" {
  id = "subnet-0035e7eff69774017"
}

resource "aws_security_group" "rds_security_group" {
  name        = "rds-security-group"
  description = "Security group for RDS"

  // Regra permitindo tráfego de entrada de qualquer origem
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Adicione outras regras de entrada, se necessário

  // Regra padrão permitindo todo tráfego de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "fiap-techchallenge-rds" {
  engine = "mysql"
  engine_version = "8.0.33"
  db_name = "fiaptechchallenge"
  allocated_storage = 20
  instance_class = "db.t3.micro"
  storage_type = "gp2"
  identifier = "fiap-techchallenge-db"
  username = var.db_username
  password = var.db_password
  publicly_accessible = true
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]

  tags = {
    Name = "fiap-techchallenge"
  }
}


resource "aws_db_subnet_group" "rds_subnet" {
  name       = "rds-subnet"
  subnet_ids = [data.aws_subnet.subnet_1.id, data.aws_subnet.subnet_2.id, data.aws_subnet.subnet_3.id]

  tags = {
    Name = "My DB subnet group"
  }
}
