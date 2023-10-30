variable "db_username" {
  type      = string
  sensitive = false
  default   = ${{ secrets.DB_USERNAME }}
}