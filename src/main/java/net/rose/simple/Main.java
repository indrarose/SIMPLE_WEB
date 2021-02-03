package net.rose.simple;

import org.springframework.boot.Banner;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.lang.invoke.MethodHandles;

@PropertySource(value = "file:conf/app.properties")
@SpringBootApplication(scanBasePackages = "net.rose")
@EnableWebMvc
@EnableJpaAuditing
public class Main {

	static {
        System.setProperty("logging.config", "conf/logback.xml");
		System.setProperty("java.net.preferIPv4Stack", "true");
	}

	public static void main(String[] args) throws Exception {
		new SpringApplicationBuilder(MethodHandles.lookup().lookupClass())
				.headless(true)
				.bannerMode(Banner.Mode.OFF)
				.run(args);
	}
}
