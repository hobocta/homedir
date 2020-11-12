@ECHO OFF
setlocal DISABLEDELAYEDEXPANSION
SET BIN_TARGET=c:\Users\Anton\vendor\squizlabs\php_codesniffer\bin\phpcs
php "%BIN_TARGET%" %* --config-set report_width 120
