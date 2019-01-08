@echo off

if exist %1\web.config (
    set message=Warning: We detected a Web.config in your app. This probably means that you want to use the HWC Buildpack (run cf buildpacks for exact buildpack name). If you really want to use the Binary Buildpack, you must specify a start command.
) else (
    set message=Error: no start command specified during staging or launch
)

echo ---
echo default_process_types:
echo   web: "cmd /c \"echo %message% ^>^&2 ^& exit 1\""
