echo "without cache" >> cache_load_result.md
echo "время 60 количество потоков 1 количество соединений 1"  >> cache_load_result.md
wrk -d 60 -t 1 -c 1 --latency -s ./get.lua http://localhost:8081/  >> cache_load_result.md
echo " " >> cache_load_result.md
echo "время 60 количество потоков 10 количество соединений 10"  >> cache_load_result.md
wrk -d 60 -t 10 -c 10 --latency -s ./get.lua http://localhost:8081/  >> cache_load_result.md
echo " " >> cache_load_result.md
echo "время 60 количество потоков 50 количество соединений 50"  >> cache_load_result.md
wrk -d 60 -t 50 -c 50 --latency -s ./get.lua http://localhost:8081/  >> cache_load_result.md
echo " " >> cache_load_result.md


echo "with cache"  >> cache_load_result.md
echo "время 60 количество потоков 1 количество соединений 1"  >> cache_load_result.md
wrk -d 60 -t 1 -c 1 --latency -s ./get.lua http://localhost:8082/  >> cache_load_result.md
echo " " >> cache_load_result.md
echo "время 60 количество потоков 10 количество соединений 10"  >> cache_load_result.md
wrk -d 60 -t 10 -c 10 --latency -s ./get.lua http://localhost:8082/  >> cache_load_result.md
echo " " >> cache_load_result.md
echo "время 60 количество потоков 50 количество соединений 50"  >> cache_load_result.md
wrk -d 60 -t 50 -c 50 --latency -s ./get.lua http://localhost:8082/  >> cache_load_result.md
echo " " >> cache_load_result.md

