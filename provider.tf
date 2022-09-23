provider "google" {
    region = "us-central1"
    credentials = file("service-account.json")
    project = "csubrsnzorjkvdca"
}
