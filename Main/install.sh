SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=true
LATESTARTSERVICE=true

print_modname() {
  ui_print "*******************************"
  ui_print "           DSOA         "
  ui_print "       "
  ui_print "                             "
  ui_print "           𝘉𝘺 VL              "
  ui_print "*******************************"
}

on_install() {
  unzip -o "$ZIPFILE" 'system/*' -d "$MODPATH" >&2
}

set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0755 0644
}