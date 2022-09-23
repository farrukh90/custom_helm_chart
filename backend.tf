terraform {
  backend "gcs" {
    bucket = "backend-csubrsnzorjkvdca"
    prefix = "/dev/home/projectxforfebruary/project_infrastructure/artemis"
  }
}