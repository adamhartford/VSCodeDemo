# Stop any servers running on port 5001
ps aux | grep -i xsp4.*5001 | xargs kill -9

cd ./VSCodeDemo && MONO_MANAGED_WATCHER="y" MONO_OPTIONS="--debug --debugger-agent=transport=dt_socket,server=y,suspend=n,setpgid=y,address=127.0.0.1:55555"  MONO_ASPNET_WEBCONFIG_CACHESIZE="2000" xsp4 --address 127.0.0.1 --port 5001 --nonstop &

# I've found that making a request too soon causes the debugger to fail to attach.
sleep 2s

open http://127.0.0.1:5001 &

echo 'Server started'

read quit