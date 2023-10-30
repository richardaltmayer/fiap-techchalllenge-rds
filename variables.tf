variable "db_username" {
  type      = string
  sensitive = true
  default   = ${{ secrets.DB_USERNAME }}
}