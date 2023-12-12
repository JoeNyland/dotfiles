require "fileinto";

if allof (
  header :contains "subject" "Cron",
  header :contains "subject" "syncoid",
  address :domain :contains "To" "joe.nyland.io"
) {
  fileinto "Backups";
}
