variable "db_username" {
  type      = string
  sensitive = false
  value     = ${{ secrets.DB_USERNAME }}
}