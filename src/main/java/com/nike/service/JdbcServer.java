package com.nike.server;

import org.springframework.ui.Model;

public interface JdbcServer {
	public void execute(Model model);
}
