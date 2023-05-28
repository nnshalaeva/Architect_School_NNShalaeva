* **without cache**
  * **время 60 количество потоков 1 количество соединений 1**
    * Running 1m test @ http://localhost:8081/
      * 1 threads and 1 connections
      * Thread Stats   Avg      Stdev     Max   +/- Stdev
        * Latency     2.74ms    3.32ms  51.00ms   94.31%
        * Req/Sec   455.92    142.40   616.00     82.17%
      * Latency Distribution
         * 50%    1.88ms
         * 75%    2.06ms
         * 90%    3.83ms
         * 99%   19.61ms
      * 27268 requests in 1.00m, 8.06MB read
    * Requests/sec:    453.78
    * Transfer/sec:    137.38KB
   
  * **время 60 количество потоков 10 количество соединений 10**
    * Running 1m test @ http://localhost:8081/
      * 10 threads and 10 connections
      * Thread Stats   Avg      Stdev     Max   +/- Stdev
        * Latency    19.24ms    4.46ms  69.03ms   83.41%
        * Req/Sec    52.08      6.97    70.00     59.98%
      * Latency Distribution
         * 50%   18.24ms
         * 75%   20.29ms
         * 90%   24.10ms
         * 99%   35.77ms
      * 31251 requests in 1.00m, 8.97MB read
    * Requests/sec:    520.10
    * Transfer/sec:    152.83KB
   
  * **время 60 количество потоков 50 количество соединений 50**
    * Running 1m test @ http://localhost:8081/
      * 50 threads and 50 connections
      * Thread Stats   Avg      Stdev     Max   +/- Stdev
        * Latency    23.28ms   15.85ms  32.67ms   66.67%
        * Req/Sec     1.16      3.21    10.00     88.00%
      * Latency Distribution
         * 50%   32.18ms
         * 75%   32.67ms
         * 90%   32.67ms
         * 99%   32.67ms
      * 25 requests in 1.00m, 7.31KB read
      * Socket errors: connect 0, read 12, write 0, timeout 22
    * Requests/sec:      0.42
    * Transfer/sec:     124.50B
 
* **with cache**
  * **время 60 количество потоков 1 количество соединений 1**
    * Running 1m test @ http://localhost:8082/
      * 1 threads and 1 connections
      * Thread Stats   Avg      Stdev     Max   +/- Stdev
        * Latency     1.36ms    1.17ms  23.98ms   94.92%
        * Req/Sec   833.15     96.08     1.00k    72.50%
      * Latency Distribution
         * 50%    1.10ms
         * 75%    1.20ms
         * 90%    1.39ms
         * 99%    7.34ms
      * 49787 requests in 1.00m, 13.63MB read
    * Requests/sec:    829.13
    * Transfer/sec:    232.38KB
   
  * **время 60 количество потоков 10 количество соединений 10**
    * Running 1m test @ http://localhost:8082/
      * 10 threads and 10 connections
      * Thread Stats   Avg      Stdev     Max   +/- Stdev
        * Latency     7.10ms    2.35ms  44.02ms   90.27%
        * Req/Sec   143.22     24.31   222.00     69.37%
      * Latency Distribution
         * 50%    6.69ms
         * 75%    7.51ms
         * 90%    8.83ms
         * 99%   19.08ms
      * 85726 requests in 1.00m, 24.46MB read
    * Requests/sec:   1426.32
    * Transfer/sec:    416.74KB
   
  * **время 60 количество потоков 50 количество соединений 50**
    * Running 1m test @ http://localhost:8082/
      * 50 threads and 50 connections
      * Thread Stats   Avg      Stdev     Max   +/- Stdev
        * Latency    63.76ms   24.50ms 108.12ms   59.09%
        * Req/Sec     9.07      6.31    20.00     65.12%
      * Latency Distribution
         * 50%   55.52ms
         * 75%   76.38ms
         * 90%  101.13ms
         * 99%  108.12ms
      * 51 requests in 1.00m, 14.95KB read
      * Socket errors: connect 0, read 2, write 0, timeout 7
    * Requests/sec:      0.85
    * Transfer/sec:     254.73B

