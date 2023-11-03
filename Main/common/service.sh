#!/system/bin/sh
MODDIR=${0%/*}

write() {
	# Bail out if file does not exist
	[[ ! -f "$1" ]] && return 1
	
	# Make file writable in case it is not already
	chmod +w "$1" 2> /dev/null

	# Write the new value and bail if there's an error
	if ! echo "$2" > "$1" 2> /dev/null
	then
		echo "Failed: $1 → $2"
		return 1
	fi
}

sleep 5

####################################
# Tweaking Android (thx to Melody Script https://github.com/ionuttbara/melody_android)
####################################
su -c "cmd settings put secure long_press_timeout 250"
su -c "cmd settings put secure multi_press_timeout 250"
su -c "cmd settings put secure assistant 0"
su -c "cmd settings put global google_core_control 0"
su -c "cmd settings put secure adaptive_connectivity_enabled 0"
su -c "cmd settings put system multicore_packet_scheduler 1"
su -c "cmd settings put secure tap_duration_threshold 0.0"
su -c "cmd settings put secure touch_blocking_period 0.0"
su -c "cmd settings put global hotword_detection_enabled 0"
su -c "cmd settings put global activity_starts_logging_enabled 0"
su -c "cmd settings put global ble_scan_always_enabled 0"
su -c "cmd settings put global hotword_detection_enabled 0"
su -c "cmd settings put global mobile_data_always_on 0"
su -c "cmd settings put global network_recommendations_enabled 0"
su -c "cmd settings put global wifi_scan_always_enabled 0"
su -c "cmd settings put secure screensaver_activate_on_dock 0"
su -c "cmd settings put secure screensaver_activate_on_sleep 0" 
su -c "cmd settings put secure screensaver_enabled 0"
su -c "cmd settings put secure send_action_app_error 0"
su -c "cmd settings put system air_motion_engine 0"
su -c "cmd settings put system air_motion_wake_up 0"
su -c "cmd settings put system master_motion 0"
su -c "cmd settings put system motion_engine 0"
su -c "cmd settings put system nearby_scanning_enabled 0"
su -c "cmd settings put system nearby_scanning_permission_allowed 0"
su -c "cmd settings put system rakuten_denwa 0"
su -c "cmd settings put system send_security_reports 0"
su -c "pm disable com.android.shell.tombstoned"

####################################
# Services
####################################
su -c "stop logcat"
su -c "stop logcatd" 
su -c "stop logd" 
su -c "stop tcpdump" 
su -c "stop cnss_diag" 
su -c "stop statsd"
su -c "stop traced" 
su -c "stop idd-logreader" 
su -c "stop idd-logreadermain" 
su -c "stop stats" 
su -c "stop dumpstate" 
su -c "stop aplogd" 
su -c "stop tcpdump" 
su -c "stop vendor.tcpdump" 
su -c "stop vendor_tcpdump" 
su -c "stop vendor.cnss_diag"



####################################
# Wi-Fi Logs (thx to @LeanHijosdesusMadres)
####################################
rm -rf /data/vendor/wlan_logs
touch /data/vendor/wlan_logs
chmod 000 /data/vendor/wlan_logs

####################################
# Useless Services 
####################################
su -c "pm disable com.google.android.gms/com.google.android.gms.mdm.receivers.MdmDeviceAdminReceiver"

####################################
# Kernel Debugging (thx to KTSR)
####################################
for i in "debug_mask" "log_level*" "debug_level*" "*debug_mode" "enable_ramdumps" "edac_mc_log*" "enable_event_log" "*log_level*" "*log_ue*" "*log_ce*" "log_ecn_error" "snapshot_crashdumper" "seclog*" "compat-log" "*log_enabled" "tracing_on" "mballoc_debug"; do
    for o in $(find /sys/ -type f -name "$i"); do
        echo "0" > "$o"
    done
done

for sys in /sys; do
    echo "1" > "$sys/module/spurious/parameters/noirqdebug"
    echo "0" > "$sys/kernel/debug/sde_rotator0/evtlog/enable"
	echo "0" > "$sys/kernel/debug/dri/0/debug/enable"
	echo "0" > "$sys/module/rmnet_data/parameters/rmnet_data_log_level"
done

echo "0" > "/proc/sys/debug/exception-trace"
echo "0" > "/proc/sys/kernel/sched_schedstats"
	
####################################
# CRC
####################################
for parameters in /sys/module/mmc_core/parameters/*; do
    echo "0" > "$parameters/crc"
    echo "0" > "$parameters/removable"
    echo "0" > "$parameters/use_spi_crc"
done

####################################
# Printk (thx to KNTD-reborn)
####################################
echo "0 0 0 0" > "/proc/sys/kernel/printk"
echo "0" > "/sys/kernel/printk_mode/printk_mode"
echo "0" > "/sys/module/printk/parameters/cpu"
echo "0" > "/sys/module/printk/parameters/pid"
echo "0" > "/sys/module/printk/parameters/printk_ratelimit"
echo "0" > "/sys/module/printk/parameters/time"
echo "1" > "/sys/module/printk/parameters/console_suspend"
echo "1" > "/sys/module/printk/parameters/ignore_loglevel"
echo "off" > "/proc/sys/kernel/printk_devkmsg"

####################################
# Ramdumps
####################################
for parameters in /sys/module/subsystem_restart/parameters; do
    echo "0" > "$parameters/enable_mini_ramdumps"
    echo "0" > "$parameters/enable_ramdumps"
done

####################################
# I/O
####################################
for queue in /sys/block/*/queue; do
    echo "0" > "$queue/iostats"
done

####################################
# File System
####################################
for fs in /proc/sys/fs; do
    echo "0" > "$fs/by-name/userdata/iostat_enable"
    echo "0" > "$fs/dir-notify-enable"
done

####################################
# Touchboost
####################################
echo "0" > "/sys/module/msm_perfmon/parameters/touch_boost_enable"
echo "0" > "/sys/module/msm_perfmon/parameters/touch_boost_freq"
echo "0" > "/sys/module/msm_performance/parameters/touchboost"
echo "0" > "/sys/power/pnpmgr/touch_boost"

exit 0
