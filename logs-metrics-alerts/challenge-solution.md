# Challenge solution: log, metric or alert?

**The question:** which is a log, which is a metric, which is an alert?

1. "Disk 91% full", read every minute.
2. `ERROR payment timeout`
3. A message on your phone: "shop errors high".

**The answers:**

1. **Metric.** It is a number (91%), measured again and again over time (every minute). Drawn as a
   chart on a dashboard, it shows if the disk is filling up.
2. **Log.** It is a line of text written by a program when something happened (a payment did not get
   an answer in time). A real log line also starts with the time.
3. **Alert.** It is a message sent to a person, because a metric (errors per minute) crossed a line.

**How they work together:** the metric shows that something is wrong, the alert calls the person on
call, and the logs tell that person why.

**And the one question:** does message 3 pass the test "does a person need to act now"? Yes: customers
are getting errors right now. The disk at 91% may become an alert too, if it keeps growing toward 100%.
