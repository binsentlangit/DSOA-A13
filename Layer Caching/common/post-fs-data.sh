#!/system/bin/sh

resetprop -n ro.surface_flinger.enable_layer_caching true
resetprop -n debug.sf.layer_caching_active_layer_timeout_ms 1000