SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=true
LATESTARTSERVICE=false

print_modname() {
  ui_print "*******************************"
  ui_print "   @nonosvaimos en Telegram   "
  ui_print "*******************************"
}

MOD_EXTRACT() {
 unzip -o "$ZIPFILE" system/* -d $MODPATH >&2
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}