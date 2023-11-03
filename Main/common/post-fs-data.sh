#!/system/bin/sh

##########################
# MULTI-CORE DEX OPT ENABLED
##########################

resetprop -n tombstoned.max_tombstone_count 0
resetprop -n persist.sys.dalvik.multithread true
resetprop -n ro.surface_flinger.enable_layer_caching true
resetprop -n debug.sf.layer_caching_active_layer_timeout_ms 1000

####################################
# Disable shit
####################################
resetprop -n logcat.live disable
resetprop -n wifi.supplicant_scan_interval 180
resetprop -n profiler.force_disable_err_rpt 1
resetprop -n profiler.force_disable_ulog 1
resetprop -n av.debug.disable.pers.cache true
resetprop -n config.disable_rtt true
resetprop -n config.stats 0
resetprop -n db.log.slow_query_threshold 0
resetprop -n debug.atrace.tags.enableflags false
resetprop -n debug.egl.profiler 0
resetprop -n debug.enable.gamed false
resetprop -n debug.enable.wl_log false
resetprop -n debug.hwc.otf 0
resetprop -n debug.hwc_dump_en 0
resetprop -n debug.mdpcomp.logs 0
resetprop -n debug.qualcomm.sns.daemon 0
resetprop -n debug.qualcomm.sns.libsensor1 0
resetprop -n debug.sf.ddms 0
resetprop -n debug.sf.disable_client_composition_cache 1
resetprop -n debug.sf.dump 0
resetprop -n debug.sqlite.journalmode OFF
resetprop -n debug.sqlite.wal.syncmode OFF
resetprop -n debug_test 0
resetprop -n libc.debug.malloc 0
resetprop -n log.shaders 0
resetprop -n log.tag.all 0
resetprop -n log.tag.stats_log OFF
resetprop -n log_ao 0
resetprop -n log_frame_info 0
resetprop -n logd.logpersistd.enable false
resetprop -n logd.statistics 0
resetprop -n media.metrics.enabled false
resetprop -n media.metrics 0
resetprop -n media.stagefright.log-uri 0
resetprop -n net.ipv4.tcp_no_metrics_save 1
resetprop -n persist.anr.dumpthr 0
resetprop -n persist.data.qmi.adb_logmask 0
resetprop -n persist.debug.sensors.hal 0 
resetprop -n persist.debug.wfd.enable false
resetprop -n persist.ims.disableADBLogs true
resetprop -n persist.ims.disabled true
resetprop -n persist.ims.disableDebugLogs true
resetprop -n persist.ims.disableIMSLogs true
resetprop -n persist.ims.disableQXDMLogs true
resetprop -n persist.logd.limit OFF
resetprop -n persist.logd.size.crash OFF
resetprop -n persist.logd.size.radio OFF
resetprop -n persist.logd.size.system OFF
resetprop -n persist.logd.size OFF
resetprop -n persist.oem.dump 0
resetprop -n persist.service.logd.enable false
resetprop -n persist.sys.perf.debug false
resetprop -n persist.sys.ssr.enable_debug false
resetprop -n persist.sys.ssr.restart_level 1
resetprop -n persist.sys.strictmode.disable true
resetprop -n persist.traced.enable false
resetprop -n persist.traced_perf.enable false
resetprop -n persist.vendor.crash.cnt 0
resetprop -n persist.vendor.crash.detect false
resetprop -n persist.vendor.radio.adb_log_on 0
resetprop -n persist.vendor.radio.snapshot_enabled false
resetprop -n persist.vendor.radio.snapshot_timer 0
resetprop -n persist.vendor.sys.modem.logging.enable false
resetprop -n persist.vendor.sys.reduce_qdss_log 1
resetprop -n persist.vendor.verbose_logging_enabled false
resetprop -n persist.wpa_supplicant.debug false
resetprop -n ro.config.ksm.support false
resetprop -n ro.config.nocheckin 1
resetprop -n ro.debuggable 0
resetprop -n ro.kernel.android.checkjni 0
resetprop -n ro.logd.kernel false
resetprop -n ro.logd.size.stats OFF
resetprop -n ro.logd.size OFF
resetprop -n ro.logdumpd.enabled false
resetprop -n ro.statsd.enable false
resetprop -n ro.telephony.call_ring.multiple false
resetprop -n ro.vendor.connsys.dedicated.log 0
resetprop -n rw.logger 0
resetprop -n sys.miui.ndcd 0
resetprop -n sys.wifitracing.started 0
resetprop -n vendor.vidc.debug.level 0
resetprop -n vidc.debug.level 0

####################################
# LMK
####################################
resetprop -n ro.lmk.debug false
resetprop -n ro.lmk.log_stats false

####################################
# Dalvik
####################################
resetprop -n dalvik.gc.type precise
resetprop -n dalvik.vm.check-dex-sum false
resetprop -n dalvik.vm.checkjni false
resetprop -n dalvik.vm.dex2oat-minidebuginfo false
resetprop -n dalvik.vm.minidebuginfo false
resetprop -n dalvik.vm.verify-bytecode false

####################################
# Disable MultiUser
####################################
resetprop -n android.allow_multiple_users 0
resetprop -n android.multiuser.guest.enabled false
resetprop -n android.multiuser.multiple_users_enabled false
resetprop -n fw.max_users 0
resetprop -n fw.show_guest_on_lockscreen 0
resetprop -n fw.show_hidden_users 0
resetprop -n fw.show_multiuserui 0
resetprop -n fw.user_creation_disabled true

####################################
# Bye Blur
####################################
resetprop -n disableBlurs true
resetprop -n enable_blurs_on_windows 0
resetprop -n persist.sys.sf.disable_blurs true
resetprop -n ro.launcher.blur.appLaunch 0
resetprop -n ro.sf.blurs_are_expensive 1
resetprop -n ro.surface_flinger.supports_background_blur 0

