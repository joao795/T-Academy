package br.com.servico1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.

@SpringBootApplication
@EnableDiscoveryClient
public class Servico1Application {

	public static void main(String[] args) {
		SpringApplication.run(Servico1Application.class, args);
	}

}
