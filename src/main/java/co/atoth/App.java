package co.atoth;

import com.hazelcast.core.Hazelcast;
import com.hazelcast.core.HazelcastInstance;

import java.lang.management.ManagementFactory;
import java.util.Date;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

public class App {

    private static final String CACHE_NAME = "cache";
    private static final String JVM_NAME = ManagementFactory.getRuntimeMXBean().getName();

    public static void main(String[] args) {

        // Start the Embedded Hazelcast Cluster Member.
        HazelcastInstance hz = Hazelcast.newHazelcastInstance();

        // Get the Distributed Map from Cluster.
        final Map<String, String> cache = hz.getMap(CACHE_NAME);

        Timer timer = new Timer();

        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                String time = new Date().toString();
                System.out.println("Caching: \"" + JVM_NAME + "\": \""+ time + "\"");
                cache.put(JVM_NAME, time);
            }
        }, 0, 1000);
    }
}
