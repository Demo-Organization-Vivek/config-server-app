package com.dd.config.service.actuator;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.actuate.info.Info;
import org.springframework.boot.actuate.info.InfoContributor;
import org.springframework.stereotype.Component;


@Slf4j
@Component
public class ServiceInfoIndicator implements InfoContributor {


    @Override
    public void contribute(Info.Builder builder) {
        builder.withDetail("Application", "config-service");
        builder.withDetail("Author", "Vivek Mishra");
        builder.withDetail("Version", "1.0");
        builder.withDetail("Description", "Application to act as config Server!");
        builder.build();

        log.info("Application info has been configured!");
    }
}
